<template>
  <div class="create-diary-page">
    <div
      class="create-diary-container"
      :style="{ border: `1px solid ${selectedColor}`, boxShadow: `0 8px 32px ${selectedColor}40` }"
    >
      <!-- 面包屑导航 -->
      <div class="breadcrumb">
        <span class="breadcrumb-link">首页</span>
        <span class="breadcrumb-separator"> > </span>
        <span class="breadcrumb-current">新建日记</span>
      </div>

      <!-- 页面标题 -->
      <h1 class="page-title">> 新建日记 <</h1>

      <!-- 信息栏 -->
      <div class="info-section">
        <div class="info-row">
          <div class="info-item">
            <label>记忆日期:</label>
            <input type="date" v-model="diary.date" class="date-input">
          </div>

          <div class="spacer"></div>

          <div class="info-item color-picker-item">
            <label>记忆颜色:</label>
            <div class="color-picker-wrapper">
              <div
                class="color-preview"
                :style="{ backgroundColor: selectedColor }"
                @click="openColorPicker"
              ></div>
              <span class="color-value">{{ selectedColor }}</span>
              <input
                ref="colorInput"
                type="color"
                v-model="selectedColor"
                class="color-input-hidden"
                @input="onColorChange"
              >
            </div>
          </div>
        </div>

        <div class="info-item">
          <label>天气</label>
          <div class="tab-options">
            <button
              v-for="(weather, index) in weatherOptions"
              :key="index"
              :class="['tab-btn', { active: diary.weather === weather.value }]"
              @click="selectWeather(weather.value)"
            >
              {{ weather.label }}
            </button>
          </div>
        </div>

        <div class="info-item">
          <label>心情</label>
          <div class="tab-options">
            <button
              v-for="(mood, index) in moodOptions"
              :key="index"
              :class="['tab-btn', { active: diary.mood === mood.value }]"
              @click="selectMood(mood.value)"
            >
              {{ mood.label }}
            </button>
          </div>
        </div>

        <!-- 文章类型 -->
        <div class="info-item">
          <label>类型:</label>
          <div class="tab-options">
            <button
              v-for="(articleType, index) in articleTypeOptions"
              :key="index"
              :class="['tab-btn', { active: diary.articleType === articleType.value }]"
              @click="selectArticleType(articleType.value)"
            >
              {{ articleType.label }}
            </button>
          </div>
        </div>
      </div>

      <!-- 标签（多选） -->
      <div class="tag-section">
        <div class="tag-section-header">
          <label>标签:</label>
        </div>
        <div class="tag-options">
          <button
            v-for="(tag, index) in tagOptions"
            :key="index"
            :class="['tag-btn', { active: diary.tags.includes(tag.value) }]"
            @click="toggleTag(tag.value)"
          >
            {{ tag.label }}
          </button>
        </div>
      </div>

      <!-- 输入区域 -->
      <div class="input-section">
        <div class="title-input-wrapper">
          <input
            type="text"
            v-model="diary.title"
            placeholder="请输入日记标题..."
            class="title-input"
          >
        </div>

        <!-- 添加图片模块 -->
        <div class="image-upload-section">
          <div class="image-upload-header">
            <label class="image-label">添加配图：</label>
            <div class="image-upload-controls">
              <input
                type="file"
                ref="fileInput"
                accept="image/jpeg,image/png,image/jpg"
                multiple
                style="display: none"
                @change="handleImageUpload"
              >
              <button
                class="image-upload-btn"
                @click="$refs.fileInput.click()"
              >
                选择图片
              </button>
              <span class="image-tip">最多上传 3 张</span>
            </div>
          </div>

          <!-- 图片预览区域 -->
          <div v-if="diary.images && diary.images.length > 0" class="image-preview-container">
            <div
              v-for="(image, index) in diary.images"
              :key="index"
              class="image-preview-item"
            >
              <img
                :src="image.url"
                :alt="image.name"
                class="preview-image"
              >
              <button
                class="remove-image-btn"
                @click="removeImage(index)"
              >
                ×
              </button>
            </div>
          </div>
        </div>

        <div class="content-input-wrapper">
          <textarea
            v-model="diary.content"
            placeholder="记录今天发生的事情..."
            class="content-input"
            @input="updateWordCount"
          ></textarea>
        </div>

        <div class="input-footer">
          <span class="word-count">正文字数：{{ wordCount }} 字</span>
        </div>
      </div>

      <!-- 底部操作按钮 -->
      <div class="action-buttons">
        <button class="btn-cancel" @click="cancel">取消</button>
        <button class="btn-save" @click="saveDiary">保存日记</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'CreateDiary',
  data() {
    return {
      diary: {
        date: '2025-11-04',
        weather: '1',
        mood: 'happy',
        articleType: 'diary', // 新增文章类型字段
        tags: [], // 将单个tag改为tags数组以支持多选
        title: '',
        content: '',
        images: []
      },
      wordCount: 0,
      selectedColor: '#3498db', // 默认蓝色
      weatherOptions: [
        { label: '晴天', value: '1' },
        { label: '多云', value: '2' },
        { label: '雨天', value: '3' },
        { label: '雪天', value: '4' },
        { label: '阴天', value: '5' },
        { label: '雨夹雪', value: '6' },
        { label: '雾天', value: '7' },
        { label: '霾天', value: '8' },
        { label: '沙尘天气', value: '9' },
        { label: '雷阵雨', value: '10' },
        { label: '冰雹', value: '11' },
        { label: '霜冻', value: '12' },
        { label: '大风', value: '13' },
        { label: '台风', value: '14' }
      ],
      moodOptions: [
        { label: '开心', value: 'happy' },
        { label: '平静', value: 'calm' },
        { label: '难过', value: 'sad' },
        { label: '兴奋', value: 'excited' },
        { label: '愤怒', value: 'angry' },
        { label: '焦虑', value: 'anxious' },
        { label: '疲惫', value: 'tired' },
        { label: '烦躁', value: 'irritable' },
        { label: '惊喜', value: 'surprised' },
        { label: '失望', value: 'disappointed' },
        { label: '满足', value: 'satisfied' },
        { label: '孤独', value: 'lonely' },
        { label: '紧张', value: 'nervous' },
        { label: '放松', value: 'relaxed' },
        { label: '愧疚', value: 'guilty' },
        { label: '自豪', value: 'proud' }
      ],
      // 文章类型选项
      articleTypeOptions: [
        { label: '日记', value: 'diary' },
        { label: '随笔', value: 'essay' },
        { label: '游记', value: 'travel' },
        { label: '读书笔记', value: 'reading' },
        { label: '工作日志', value: 'worklog' }
      ],
      tagOptions: [
        { label: '日常生活', value: 'daily' },
        { label: '学习笔记', value: 'study' },
        { label: '旅行见闻', value: 'travel' },
        { label: '工作记录', value: 'work' },
        { label: '兴趣爱好', value: 'hobby' },
        { label: '美食探索', value: 'food' },
        { label: '影视评论', value: 'movie' },
        { label: '音乐分享', value: 'music' },
        { label: '书籍读后感', value: 'book' },
        { label: '职场心得', value: 'career' },
        { label: '社交聚会', value: 'social' },
        { label: '健身运动', value: 'fitness' },
        { label: '思考感悟', value: 'thought' },
        { label: '技能分享', value: 'skill' },
        { label: '好物推荐', value: 'recommend' },
        { label: '志愿服务', value: 'volunteer' },
        { label: '节日纪念', value: 'festival' },
        { label: '理财规划', value: 'finance' }
      ]
    }
  },
  methods: {
    selectWeather(weather) {
      this.diary.weather = weather;
    },
    selectMood(mood) {
      this.diary.mood = mood;
    },
    // 新增文章类型选择方法
    selectArticleType(articleType) {
      this.diary.articleType = articleType;
    },
    // 将标签选择改为切换方式以支持多选，实现队列式选择（最多3个）
    toggleTag(tag) {
      const index = this.diary.tags.indexOf(tag);
      if (index === -1) {
        // 如果标签不存在
        if (this.diary.tags.length >= 3) {
          // 如果已达到3个标签，移除第一个并添加新标签到末尾
          this.diary.tags.shift(); // 移除第一个元素
        }
        // 添加新标签到末尾
        this.diary.tags.push(tag);
      } else {
        // 如果标签已存在，则移除
        this.diary.tags.splice(index, 1);
      }
    },
    selectColor(color) {
      this.selectedColor = color;
    },
    openColorPicker() {
      // 直接触发隐藏的颜色输入框点击事件
      this.$refs.colorInput.click();
    },
    onColorChange(event) {
      this.selectedColor = event.target.value;
    },
    updateWordCount() {
      this.wordCount = this.diary.content.length;
    },
    cancel() {
      this.$router.go(-1);
    },
    saveDiary() {
      // 这里可以添加保存日记的逻辑
      console.log('保存日记:', this.diary);
      alert('日记已保存！');
      this.$router.go(-1);
    },
    handleImageUpload(event) {
      const files = event.target.files;
      if (files.length === 0) return;

      // 限制最多上传3张图片
      if (this.diary.images.length + files.length > 3) {
        alert('最多只能上传3张图片');
        return;
      }

      // 处理每个选择的文件
      for (let i = 0; i < files.length; i++) {
        const file = files[i];
        // 检查文件类型
        if (!file.type.startsWith('image/')) {
          alert('请选择图片文件');
          continue;
        }

        // 创建预览URL
        const url = URL.createObjectURL(file);

        // 添加到图片数组
        this.diary.images.push({
          name: file.name,
          url: url,
          file: file
        });
      }

      // 清空input值，确保下次选择相同文件也能触发change事件
      event.target.value = '';
    },
    removeImage(index) {
      // 移除图片
      this.diary.images.splice(index, 1);
    }
  }
}
</script>

<style scoped>
.create-diary-page {
  display: flex;
  justify-content: center;
  padding: 2rem;
  min-height: 100vh;
  background: linear-gradient(135deg, rgba(180, 170, 190, 0.85), rgba(220, 200, 190, 0.85), rgba(245, 235, 220, 0.85));
  animation: gradientFlow 20s ease infinite;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  /* 渐变过渡自然，保留轻微流动感但更柔和 */
  background-size: 200% 200%;
  border-radius: 24px;
  position: relative;
}

.create-diary-container {
  width: 100%;
  max-width: 1200px;
  background: rgba(255, 255, 255, 0.3);
  border-radius: 15px;
  padding: 2rem;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(10px);
  border: 1px solid rgba(255, 255, 255, 0.1);
  transition: all 0.3s ease;
}

/* 更缓慢的渐变流动动画 */
@keyframes gradientFlow {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

/* 面包屑导航 */
.breadcrumb {
  margin-bottom: 1rem;
  font-size: 0.9rem;
  color: #34495e;
}

.breadcrumb-link {
  color: #3498db;
  cursor: pointer;
}

.breadcrumb-separator {
  margin: 0 0.5rem;
  color: #7f8c8d;
}

.breadcrumb-current {
  color: #2c3e50;
}

/* 页面标题 */
.page-title {
  font-size: 1.8rem;
  color: #2c3e50;
  margin-bottom: 2rem;
  text-align: center;
}

/* 信息栏 */
.info-section {
  margin-bottom: 2rem;
}

.info-row {
  display: flex;
  flex-wrap: wrap;
  gap: 2rem;
  margin-bottom: 1.5rem;
  align-items: flex-end;
}

.info-item {
  flex: 0 0 auto;
}

.spacer {
  flex: 1;
}

.info-item label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: bold;
  color: #2c3e50;
}

.date-input {
  padding: 0.5rem;
  border: 1px solid #ddd;
  border-radius: 5px;
  background: rgba(255, 255, 255, 0.7);
  width: 100%;
  max-width: 200px;
}

/* 颜色选择器 */
.color-picker-item {
  margin-left: auto;
}

.color-picker-wrapper {
  position: relative;
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.color-preview {
  width: 30px;
  height: 30px;
  border-radius: 50%;
  cursor: pointer;
  border: 2px solid #ddd;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.color-value {
  font-size: 0.9rem;
  color: #7f8c8d;
}

/* 隐藏的颜色输入框 */
.color-input-hidden {
  position: absolute;
  visibility: hidden;
  width: 0;
  height: 0;
}

/* 标签选项 */
.tab-options {
  display: flex;
  gap: 0.5rem;
  flex-wrap: wrap;
}

.tab-btn {
  padding: 0.5rem 1rem;
  border: 1px solid #ddd;
  border-radius: 5px;
  background: rgba(255, 255, 255, 0.7);
  cursor: pointer;
  transition: all 0.3s ease;
}

.tab-btn:hover {
  background: rgba(236, 240, 241, 0.9);
}

.tab-btn.active {
  background: #3498db;
  color: white;
  border-color: #3498db;
}

/* 标签区域（原模块区域） */
.tag-section {
  margin-bottom: 2rem;
}

.tag-section-header {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  margin-bottom: 0.5rem;
}

.tag-section-header label {
  font-weight: bold;
  color: #2c3e50;
}


.tag-options {
  display: flex;
  gap: 1rem;
  flex-wrap: wrap;
}

.tag-btn {
  padding: 0.5rem 1rem;
  border: 1px solid #ddd;
  border-radius: 20px;
  background: rgba(255, 255, 255, 0.7);
  cursor: pointer;
  transition: all 0.3s ease;
}

.tag-btn:hover {
  background: rgba(236, 240, 241, 0.9);
}

.tag-btn.active {
  background: #8e44ad;
  color: white;
  border-color: #8e44ad;
}

/* 输入区域 */
.input-section {
  margin-bottom: 2rem;
}

.title-input-wrapper {
  margin-bottom: 1rem;
}

.title-input {
  width: 100%;
  padding: 0.8rem;
  border: 1px solid #ddd;
  border-radius: 5px;
  font-size: 1.2rem;
  background: rgba(255, 255, 255, 0.7);
}

.content-input-wrapper {
  margin-bottom: 1rem;
}

.content-input {
  width: 100%;
  min-height: 200px;
  padding: 1rem;
  border: 1px solid #ddd;
  border-radius: 5px;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  font-size: 1rem;
  resize: vertical;
  background: rgba(255, 255, 255, 0.7);
}

/* 图片上传模块 */
.image-upload-section {
  margin-bottom: 1rem;
}

.image-upload-header {
  display: flex;
  align-items: center;
  margin-bottom: 1rem;
}

.image-label {
  font-weight: bold;
  color: #2c3e50;
  margin-right: 1rem;
}

.image-upload-controls {
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.image-upload-btn {
  padding: 0.5rem 1rem;
  border: none;
  border-radius: 5px;
  background: #9b59b6; /* 浅紫色 */
  color: white;
  cursor: pointer;
  transition: all 0.3s ease;
}

.image-upload-btn:hover {
  background: #8e44ad;
}

.image-tip {
  font-size: 0.8rem;
  color: #7f8c8d;
}

.image-preview-container {
  display: flex;
  gap: 1rem;
  flex-wrap: wrap;
  margin-top: 0.5rem;
}

.image-preview-item {
  position: relative;
  width: 80px;
  height: 80px;
}

.preview-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 5px;
}

.remove-image-btn {
  position: absolute;
  top: -8px;
  right: -8px;
  width: 20px;
  height: 20px;
  border-radius: 50%;
  background: #e74c3c;
  color: white;
  border: none;
  cursor: pointer;
  font-weight: bold;
  font-size: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
}

/* 输入区域底部 */
.input-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.save-status {
  color: #3498db;
  font-size: 0.9rem;
}

.word-count {
  color: #7f8c8d;
  font-size: 0.9rem;
}

/* 底部操作按钮 */
.action-buttons {
  display: flex;
  justify-content: center;
  gap: 2rem;
}

.btn-cancel, .btn-save {
  padding: 0.8rem 2rem;
  border: none;
  border-radius: 5px;
  font-size: 1rem;
  cursor: pointer;
  transition: all 0.3s ease;
}

.btn-cancel {
  background: #ecf0f1;
  color: #2c3e50;
}

.btn-cancel:hover {
  background: #bdc3c7;
}

.btn-save {
  background: linear-gradient(135deg, #3498db, #2980b9);
  color: white;
}

.btn-save:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

@media (max-width: 768px) {
  .create-diary-page {
    padding: 1rem;
  }

  .create-diary-container {
    padding: 1rem;
  }

  .info-row {
    flex-direction: column;
    gap: 1rem;
  }

  .tab-options, .tag-options {
    gap: 0.5rem;
  }

  .tab-btn, .tag-btn {
    padding: 0.4rem 0.8rem;
    font-size: 0.9rem;
  }

  .action-buttons {
    gap: 1rem;
  }

  .image-preview-item {
    width: 60px;
    height: 60px;
  }
}
</style>
