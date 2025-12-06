<template>
  <div class="create-diary-page">
    <div class="create-diary-container">
      <!-- 面包屑导航 -->
      <div class="breadcrumb">
        <span class="breadcrumb-link">首页</span>
        <span class="breadcrumb-separator"> > </span>
        <span class="breadcrumb-current">新建日记</span>
      </div>

      <!-- 页面标题 -->
      <h1 class="page-title">新建日记</h1>

      <!-- 信息栏 -->
      <div class="info-section">
        <div class="info-item">
          <label>日期:</label>
          <input type="date" v-model="diary.date" class="date-input">
        </div>

        <div class="info-item">
          <label>天气:</label>
          <div class="weather-options">
            <button
              v-for="(weather, index) in weatherOptions"
              :key="index"
              :class="['weather-btn', { active: diary.weather === weather.value }]"
              @click="selectWeather(weather.value)"
            >
              {{ weather.label }}
            </button>
          </div>
        </div>

        <div class="info-item">
          <label>心情:</label>
          <div class="mood-options">
            <button
              v-for="(mood, index) in moodOptions"
              :key="index"
              :class="['mood-btn', { active: diary.mood === mood.value }]"
              @click="selectMood(mood.value)"
            >
              {{ mood.label }}
            </button>
          </div>
        </div>
      </div>

      <!-- 所属模块 -->
      <div class="module-section">
        <label>所属模块:</label>
        <div class="module-tags">
          <button
            v-for="(module, index) in moduleOptions"
            :key="index"
            :class="['module-tag', { active: diary.module === module.value }]"
            @click="selectModule(module.value)"
          >
            {{ module.label }}
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
        module: 'daily',
        title: '',
        content: ''
      },
      wordCount: 0,
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
      moduleOptions: [
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
    selectModule(module) {
      this.diary.module = module;
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
}

.create-diary-container {
  width: 100%;
  max-width: 700px;
  background: rgba(255, 255, 255, 0.3);
  border-radius: 15px;
  padding: 2rem;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(10px);
  border: 1px solid rgba(255, 255, 255, 0.1);
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

.info-item {
  margin-bottom: 1.5rem;
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

/* 天气和心情选项 */
.weather-options, .mood-options {
  display: flex;
  gap: 1rem;
  flex-wrap: wrap;
}

.weather-btn, .mood-btn {
  padding: 0.5rem 1rem;
  border: 1px solid #ddd;
  border-radius: 20px;
  background: rgba(255, 255, 255, 0.7);
  cursor: pointer;
  transition: all 0.3s ease;
}

.weather-btn:hover, .mood-btn:hover {
  background: rgba(236, 240, 241, 0.9);
}

.weather-btn.active, .mood-btn.active {
  background: #3498db;
  color: white;
  border-color: #3498db;
}

/* 所属模块 */
.module-section {
  margin-bottom: 2rem;
}

.module-section label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: bold;
  color: #2c3e50;
}

.module-tags {
  display: flex;
  gap: 1rem;
  flex-wrap: wrap;
}

.module-tag {
  padding: 0.5rem 1rem;
  border: 1px solid #ddd;
  border-radius: 20px;
  background: rgba(255, 255, 255, 0.7);
  cursor: pointer;
  transition: all 0.3s ease;
}

.module-tag:hover {
  background: rgba(236, 240, 241, 0.9);
}

.module-tag.active {
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

  .weather-options, .mood-options, .module-tags {
    gap: 0.5rem;
  }

  .weather-btn, .mood-btn, .module-tag {
    padding: 0.4rem 0.8rem;
    font-size: 0.9rem;
  }

  .action-buttons {
    gap: 1rem;
  }
}
</style>
