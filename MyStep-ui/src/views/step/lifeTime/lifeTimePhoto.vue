<template>
  <div class="waterfall-album">
    <div class="masonry">
      <div v-for="(photo, idx) in photoList" :key="photo.id || idx" class="masonry-item">
        <div class="img-wrapper"
             @mouseenter="showTooltip(idx)"
             @mouseleave="hideTooltip(idx)">
          <img :src="'/api' + photo.filePath" :alt="photo.name || '照片'"/>
          <!-- 小心心按钮 -->
          <span class="like-btn" :class="{ liked: photo.liked }" @click.stop="handleLike(idx)"
                :disabled="photo.likeLoading">
            <i v-if="photo.liked" class="el-icon-star-on"></i>
            <i v-else class="el-icon-star-off"></i>
          </span>
          <div v-if="photo.showTooltip"
               class="memory-tooltip"
               :data-photo-index="idx"
               @click="skipTyping(idx)">
            <div class="scrolling-container" :style="{ transform: `translateY(${photo.scrollOffset}px)` }">
              <div class="text-content">
                <div v-if="photo.displayedPhrase" class="field-line">留言：{{ photo.displayedPhrase }}</div>
                <div v-if="photo.displayedDevice" class="field-line">拍摄设备：{{ photo.displayedDevice }}</div>
                <div v-if="photo.displayedShotTime" class="field-line">拍摄时间：{{ photo.displayedShotTime }}</div>
                <div v-if="photo.displayedMemory" class="field-line">记忆：{{ photo.displayedMemory }}</div>
                <span v-if="photo.isTyping" class="typing-cursor">|</span>
              </div>
              <!-- 重复文本用于无缝循环 -->
              <div v-if="photo.shouldScroll" class="text-content">
                <div class="field-line">留言：{{ photo.phrase || '' }}</div>
                <div class="field-line">拍摄设备：{{ photo.device || '' }}</div>
                <div class="field-line">拍摄时间：{{ photo.shotTime || '' }}</div>
                <div class="field-line">记忆：{{ photo.memory || '' }}</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div v-if="loading" class="loading">加载中...</div>
    <div v-if="!hasMore && photoList.length > 0" class="end">没有更多了~</div>
    <div v-if="!loading && photoList.length === 0" class="empty">暂无照片</div>
  </div>
</template>

<script>
import {getPhoto, likePhoto, UnLikePhoto} from "@/apis/api/lifeTimePhoto";

export default {
  name: 'lifeTimePhoto',
  data() {
    return {
      currentPage: 1,
      pageSize: 20,
      total: 0,
      photoList: [],
      loading: false,
      hasMore: true,
      typeId: null,
      tooltipTimers: {},
      typingTimers: {},
      scrollTimers: {}
    }
  },
  mounted() {
    this.typeId = this.$route.query.id;
    this.getPhoto(this.typeId);
    window.addEventListener('scroll', this.handleScroll);
  },
  beforeDestroy() {
    window.removeEventListener('scroll', this.handleScroll);
    // 清除所有定时器
    Object.values(this.tooltipTimers).forEach(timer => {
      if (timer) clearTimeout(timer);
    });
    Object.values(this.typingTimers).forEach(timer => {
      if (timer) clearInterval(timer);
    });
    Object.values(this.scrollTimers).forEach(timer => {
      if (timer) clearInterval(timer);
    });
  },
  methods: {
    async getPhoto(id) {
      if (this.loading || !this.hasMore) return;
      this.loading = true;
      let params = {
        pageNum: this.currentPage,
        pageSize: this.pageSize,
        typeId: id
      };
      getPhoto(params).then(res => {
        if (res.code === 200) {
          console.log('lifeTimePhoto页面收到的id:', res);
          // 为每个照片添加tooltip相关属性和like相关属性
          const photosWithTooltip = res.rows.map(photo => ({
            ...photo,
            showTooltip: false,
            displayedPhrase: '',
            displayedDevice: '',
            displayedShotTime: '',
            displayedMemory: '',
            isTyping: false,
            fullText: this.buildFullText(photo),
            scrollOffset: 0,
            shouldScroll: false,
            liked: photo.isFavorite === true, // 用isFavorite字段初始化
            likeLoading: false
          }));
          this.photoList = [...this.photoList, ...photosWithTooltip];
          this.total = res.total;
          this.hasMore = this.photoList.length < this.total;
          if (this.hasMore) {
            this.currentPage++;
          }
        }
      }).finally(() => {
        this.loading = false;
      });
    },
    async handleLike(idx) {
      const photo = this.photoList[idx];
      if (photo.likeLoading) return;
      this.$set(this.photoList[idx], 'likeLoading', true);
      try {
        let res;
        if (!photo.liked) {
          res = await likePhoto(photo.id);
        } else {
          res = await UnLikePhoto(photo.id);
        }
        if (res.code === 200) {
          this.$set(this.photoList[idx], 'liked', !photo.liked);
        } else {
          this.$message.error(res.message || (photo.liked ? '取消收藏失败' : '收藏失败'));
        }
      } catch (e) {
        this.$message.error(photo.liked ? '取消收藏异常' : '收藏异常');
      } finally {
        this.$set(this.photoList[idx], 'likeLoading', false);
      }
    },
    handleScroll() {
      const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
      const windowHeight = window.innerHeight;
      const documentHeight = document.documentElement.scrollHeight;
      const scrollPercentage = (scrollTop + windowHeight) / documentHeight;
      if (scrollPercentage > 0.8 && !this.loading && this.hasMore) {
        this.getPhoto(this.typeId);
      }
    },
    showTooltip(index) {
      // 清除之前的定时器
      if (this.tooltipTimers[index]) {
        clearTimeout(this.tooltipTimers[index]);
      }

      // 设置1秒后显示tooltip并开始打字效果
      this.tooltipTimers[index] = setTimeout(() => {
        this.$set(this.photoList[index], 'showTooltip', true);
        this.$set(this.photoList[index], 'displayedPhrase', '');
        this.$set(this.photoList[index], 'displayedDevice', '');
        this.$set(this.photoList[index], 'displayedShotTime', '');
        this.$set(this.photoList[index], 'displayedMemory', '');
        this.$set(this.photoList[index], 'isTyping', true);
        this.$set(this.photoList[index], 'scrollOffset', 0);
        this.startTyping(index);
      }, 1000);
    },
    hideTooltip(index) {
      // 清除定时器
      if (this.tooltipTimers[index]) {
        clearTimeout(this.tooltipTimers[index]);
        this.tooltipTimers[index] = null;
      }

      // 清除打字定时器
      if (this.typingTimers[index]) {
        clearInterval(this.typingTimers[index]);
        this.typingTimers[index] = null;
      }

      // 清除滚动定时器
      if (this.scrollTimers[index]) {
        clearInterval(this.scrollTimers[index]);
        this.scrollTimers[index] = null;
      }

      // 立即隐藏tooltip
      this.$set(this.photoList[index], 'showTooltip', false);
      this.$set(this.photoList[index], 'isTyping', false);
      this.$set(this.photoList[index], 'displayedPhrase', '');
      this.$set(this.photoList[index], 'displayedDevice', '');
      this.$set(this.photoList[index], 'displayedShotTime', '');
      this.$set(this.photoList[index], 'displayedMemory', '');
      this.$set(this.photoList[index], 'scrollOffset', 0);
      this.$set(this.photoList[index], 'shouldScroll', false);
    },
    startTyping(index) {
      const photo = this.photoList[index];
      const fields = [
        {key: 'phrase', label: '留言', value: photo.phrase},
        {key: 'device', label: '拍摄设备', value: photo.device},
        {key: 'shotTime', label: '拍摄时间', value: photo.shotTime},
        {key: 'memory', label: '记忆', value: photo.memory}
      ];

      let currentFieldIndex = 0;
      let currentCharIndex = 0;
      let currentField = fields[currentFieldIndex];

      this.typingTimers[index] = setInterval(() => {
        // 如果当前字段为空，跳到下一个字段
        if (!currentField.value) {
          currentFieldIndex++;
          if (currentFieldIndex < fields.length) {
            currentField = fields[currentFieldIndex];
            currentCharIndex = 0;
          } else {
            // 所有字段都完成了
            clearInterval(this.typingTimers[index]);
            this.typingTimers[index] = null;
            this.$set(this.photoList[index], 'isTyping', false);

            // 检查是否需要滚动
            this.$nextTick(() => {
              this.checkScrollNeeded(index);
            });
            return;
          }
        }

        // 如果当前字段还有字符要打
        if (currentCharIndex < currentField.value.length) {
          const displayedText = currentField.value.substring(0, currentCharIndex + 1);
          this.$set(this.photoList[index], `displayed${currentField.key.charAt(0).toUpperCase() + currentField.key.slice(1)}`, displayedText);
          currentCharIndex++;
        } else {
          // 当前字段打完了，跳到下一个字段
          currentFieldIndex++;
          if (currentFieldIndex < fields.length) {
            currentField = fields[currentFieldIndex];
            currentCharIndex = 0;
          } else {
            // 所有字段都完成了
            clearInterval(this.typingTimers[index]);
            this.typingTimers[index] = null;
            this.$set(this.photoList[index], 'isTyping', false);

            // 检查是否需要滚动
            this.$nextTick(() => {
              this.checkScrollNeeded(index);
            });
            return;
          }
        }

        // 在打字过程中实时检查是否需要滚动
        this.$nextTick(() => {
          this.checkScrollNeeded(index);
        });
      }, 50); // 每50毫秒显示一个字符
    },
    skipTyping(index) {
      const photo = this.photoList[index];

      // 清除打字定时器
      if (this.typingTimers[index]) {
        clearInterval(this.typingTimers[index]);
        this.typingTimers[index] = null;
      }

      // 直接显示所有字段的完整内容
      this.$set(this.photoList[index], 'displayedPhrase', photo.phrase || '');
      this.$set(this.photoList[index], 'displayedDevice', photo.device || '');
      this.$set(this.photoList[index], 'displayedShotTime', photo.shotTime || '');
      this.$set(this.photoList[index], 'displayedMemory', photo.memory || '');
      this.$set(this.photoList[index], 'isTyping', false);

      // 检查是否需要滚动
      this.$nextTick(() => {
        this.checkScrollNeeded(index);
      });
    },
    checkScrollNeeded(index) {
      const photo = this.photoList[index];
      const tooltipElement = document.querySelector(`[data-photo-index="${index}"] .memory-tooltip`);

      if (tooltipElement && !photo.shouldScroll) {
        const textElement = tooltipElement.querySelector('.text-content');
        if (textElement) {
          const textHeight = textElement.scrollHeight;
          const containerHeight = tooltipElement.clientHeight;

          if (textHeight > containerHeight) {
            // 需要滚动
            this.$set(this.photoList[index], 'shouldScroll', true);
            this.startScrolling(index, textHeight);
          }
        }
      }
    },
    startScrolling(index, textHeight) {
      const photo = this.photoList[index];
      let scrollOffset = 0;

      this.scrollTimers[index] = setInterval(() => {
        scrollOffset -= 1; // 向上滚动1px

        // 当第一段文字完全滚出顶部时，重置位置
        if (Math.abs(scrollOffset) >= textHeight) {
          scrollOffset = 0;
        }

        this.$set(this.photoList[index], 'scrollOffset', scrollOffset);
      }, 30); // 每30毫秒滚动一次，稍微快一点
    },
    buildFullText(photo) {
      const lines = [];
      if (photo.phrase) lines.push(`留言：${photo.phrase}`);
      if (photo.device) lines.push(`拍摄设备：${photo.device}`);
      if (photo.shotTime) lines.push(`拍摄时间：${photo.shotTime}`);
      if (photo.memory) lines.push(`记忆：${photo.memory}`);
      return lines.join('\n');
    }
  }
}
</script>

<style scoped>
.waterfall-album {
  width: 100%;
  min-height: 60vh;
  padding: 2rem 0 3rem 0;
  background: linear-gradient(135deg, #f8fafc 0%, #e0e7ef 100%);
}

.masonry {
  column-count: 4;
  column-gap: 1.5rem;
  max-width: 1400px;
  margin: 0 auto;
}

@media (max-width: 1200px) {
  .masonry {
    column-count: 3;
  }
}

@media (max-width: 900px) {
  .masonry {
    column-count: 2;
  }
}

@media (max-width: 600px) {
  .masonry {
    column-count: 1;
  }
}

.masonry-item {
  break-inside: avoid;
  margin-bottom: 1.5rem;
  border-radius: 16px;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08), 0 1.5px 4px rgba(0, 0, 0, 0.04);
  background: #fff;
  overflow: hidden;
  transition: box-shadow 0.3s, transform 0.3s;
  cursor: pointer;
}

.masonry-item:hover {
  box-shadow: 0 8px 32px rgba(80, 120, 200, 0.18), 0 2px 8px rgba(0, 0, 0, 0.08);
  transform: translateY(-4px) scale(1.02);
}

.img-wrapper {
  width: 100%;
  background: #f3f6fa;
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
}

.img-wrapper img {
  width: 100%;
  height: auto;
  display: block;
  object-fit: contain;
  border-radius: 16px;
  transition: transform 0.3s;
}

.masonry-item:hover img {
  transform: scale(1.04);
}

.memory-tooltip {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.8);
  color: white;
  padding: 1rem;
  display: flex;
  align-items: flex-start;
  justify-content: center;
  text-align: center;
  font-size: 0.9rem;
  line-height: 1.4;
  word-wrap: break-word;
  overflow-wrap: break-word;
  white-space: pre-wrap;
  border-radius: 16px;
  z-index: 10;
  animation: fadeIn 0.3s ease-in-out;
  cursor: pointer;
  overflow: hidden;
}

.scrolling-container {
  width: 100%;
  transition: transform 0.05s linear;
}

.text-content {
  width: 100%;
  word-wrap: break-word;
  overflow-wrap: break-word;
  white-space: pre-wrap;
}

.field-line {
  margin-bottom: 0.5rem;
  text-align: left;
  padding: 0.2rem 0;
}

.field-line:last-child {
  margin-bottom: 0;
}

.typing-text {
  display: inline;
}

.typing-cursor {
  display: inline;
  animation: blink 1s infinite;
  color: #fff;
  font-weight: bold;
}

@keyframes blink {
  0%, 50% {
    opacity: 1;
  }
  51%, 100% {
    opacity: 0;
  }
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

.loading, .end, .empty {
  text-align: center;
  color: #888;
  font-size: 1.1rem;
  margin: 2rem 0 1rem 0;
}

.like-btn {
  position: absolute;
  top: 10px;
  right: 12px;
  font-size: 22px;
  color: #fff;
  background: rgba(0, 0, 0, 0.25);
  border-radius: 50%;
  padding: 4px 6px;
  cursor: pointer;
  z-index: 20;
  transition: color 0.2s, background 0.2s;
  user-select: none;
  border: none;
  outline: none;
  display: flex;
  align-items: center;
  justify-content: center;
}

.like-btn.liked {
  color: #ff4d6d;
  background: #fff0f3;
}

.like-btn:active {
  background: #ffe0e6;
}

.like-btn[disabled] {
  pointer-events: none;
  opacity: 0.6;
}
</style>