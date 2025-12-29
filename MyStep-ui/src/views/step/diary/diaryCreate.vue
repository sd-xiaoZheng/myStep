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
              v-for="(weather, index) in weatherList"
              :key="index"
              :class="['tab-btn', { active: diary.weather === weather.id }]"
              @click="selectWeather(weather.id)"
            >
              {{ weather.label }}
            </button>
          </div>
        </div>

        <div class="info-item">
          <label>心情</label>
          <div class="tab-options">
            <button
              v-for="(mood, index) in moodList"
              :key="index"
              :class="['tab-btn', { active: diary.mood === mood.id }]"
              @click="selectMood(mood.id)"
            >
              {{ mood.name }}
            </button>
          </div>
        </div>

        <!-- 文章类型 -->
        <div class="info-item">
          <label>类型:</label>
          <div class="tab-options">
            <button
              v-for="(articleType, index) in typeList"
              :key="index"
              :class="['tab-btn', { active: diary.articleType === articleType.id }]"
              @click="selectArticleType(articleType.id)"
            >
              {{ articleType.name }}
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
            v-for="(tag, index) in tagList"
            :key="tag.value"
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

      <!-- 底部操作按钮 -->
      <div class="action-buttons">
        <button class="btn-cancel" @click="cancel">取消</button>
        <button class="btn-save" @click="saveDiary">保存日记</button>
      </div>
    </div>
  </div>
</template>

<script>
import { getTypeList } from '@/apis/api/type'
import { getMoodList } from '@/apis/api/mood'
import { getWeatherList } from '@/apis/api/weather'
import { getTagList } from '@/apis/api/tag'
import { addArticle } from '@/apis/api/article'

export default {
  name: 'CreateDiary',
  data() {
    return {
      diary: {
        date: '2025-11-04',
        weather: null, // 修改为使用ID
        mood: null, // 修改为使用ID
        articleType: null, // 修改为使用ID
        tags: [], // 将单个tag改为tags数组以支持多选
        title: '',
        content: '',
        images: []
      },
      wordCount: 0,
      selectedColor: '#3498db', // 默认蓝色
      typeList: [], // 从接口获取的类型列表
      moodList: [], // 从接口获取的心情列表
      weatherList: [], // 从接口获取的天气列表
      tagList: [], // 从接口获取的标签列表
    }
  },
  async mounted() {
    // 在组件挂载后获取数据
    await this.loadTypes();
    await this.loadMoods();
    await this.loadWeathers();
    await this.loadTags();
  },
  methods: {
    async loadTypes() {
      try {
        const res = await getTypeList({});
        if (res.code === 200) {
          this.typeList = res.data;
          if (this.typeList.length > 0) {
            this.diary.articleType = this.typeList[0].id; // 默认选择第一个
          }
        }
      } catch (error) {
        console.error('获取类型列表失败:', error);
      }
    },
    async loadMoods() {
      try {
        const res = await getMoodList({});
        if (res.code === 200) {
          this.moodList = res.data;
          if (this.moodList.length > 0) {
            this.diary.mood = this.moodList[0].id; // 默认选择第一个
          }
        }
      } catch (error) {
        console.error('获取心情列表失败:', error);
      }
    },
    async loadWeathers() {
      try {
        const res = await getWeatherList({});
        if (res.code === 200) {
          this.weatherList = res.data;
          if (this.weatherList.length > 0) {
            this.diary.weather = this.weatherList[0].id; // 默认选择第一个
          }
        }
      } catch (error) {
        console.error('获取天气列表失败:', error);
      }
    },
    selectWeather(weatherId) {
      this.diary.weather = weatherId;
    },
    selectMood(moodId) {
      this.diary.mood = moodId;
    },
    // 新增文章类型选择方法
    selectArticleType(articleTypeId) {
      this.diary.articleType = articleTypeId;
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
    async saveDiary() {
      try {
        // 创建 FormData 对象来发送 multipart/form-data 请求
        const formData = new FormData();

        // 添加基本字段
        formData.append('title', this.diary.title);
        formData.append('content', this.diary.content);
        formData.append('memoryTime', this.diary.date + 'T00:00:00'); // 对应后端的 memory_time 字段，转换为 LocalDateTime 格式
        formData.append('color', this.selectedColor);
        formData.append('weatherId', this.diary.weather || ''); // 对应后端的 weather_id 字段
        formData.append('moodId', this.diary.mood || ''); // 对应后端的 mood_id 字段
        formData.append('typeId', this.diary.articleType || ''); // 对应后端的 type_id 字段

        // 添加标签数组（作为整数数组）
        if (this.diary.tags && this.diary.tags.length > 0) {
          this.diary.tags.forEach(tag => {
            formData.append('tagIds', parseInt(tag)); // 确保标签ID是整数类型
          });
        }

        // 添加图片文件
        if (this.diary.images && this.diary.images.length > 0) {
          this.diary.images.forEach(image => {
            if (image.file) { // 确保图片文件存在
              formData.append('images', image.file);
            }
          });
        }

        const res = await addArticle(formData);

        if (res.code === 200) {
          this.$message.success('日记保存成功！');
          // 保存成功后返回上一页或跳转到指定页面
          this.$router.go(-1);
        } else {
          this.$message.error(res.message || '日记保存失败');
        }
      } catch (error) {
        console.error('保存日记失败:', error);
        this.$message.error('保存日记时发生错误: ' + (error.message || '未知错误'));
      }
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
    },
    async loadTags() {
      try {
        const res = await getTagList({});
        if (res.code === 200) {
          // 将接口返回的数据格式转换为组件需要的格式
          this.tagList = res.data.map(tag => ({
            label: tag.name, // 根据后端接口字段映射
            value: tag.id   // 根据后端接口字段映射
          }));
        }
      } catch (error) {
        console.error('获取标签列表失败:', error);
      }
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
