<template>
  <div class="diary-list-page">
    <!-- 顶部操作栏 -->
    <div class="toolbar">
      <div class="toolbar-left">
        <div class="filter-group">
          <select v-model="filters.mood" class="filter-select">
            <option value="">全部心情</option>
            <option value="happy">开心</option>
            <option value="calm">平静</option>
            <option value="sad">难过</option>
            <option value="excited">兴奋</option>
            <option value="angry">愤怒</option>
          </select>
        </div>
        
        <div class="filter-group">
          <input 
            type="date" 
            v-model="filters.date" 
            class="date-picker"
          />
        </div>
        
        <div class="time-range-buttons">
          <button 
            v-for="range in timeRanges" 
            :key="range.value"
            :class="['time-range-btn', { active: filters.timeRange === range.value }]"
            @click="setTimeRange(range.value)"
          >
            {{ range.label }}
          </button>
        </div>
      </div>
      
      <div class="toolbar-center">
        <div class="search-box">
          <input 
            type="text" 
            v-model="filters.keyword" 
            placeholder="搜索关键词..." 
            class="search-input"
            @keyup.enter="searchDiaries"
          />
          <button class="search-button" @click="searchDiaries">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
              <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
            </svg>
          </button>
        </div>
        
        <button class="clear-button" @click="clearFilters">
          清除筛选
        </button>
      </div>
      
      <div class="toolbar-right">
        <button class="btn btn-primary" @click="goToCreateDiary">
          + 新建日记
        </button>
      </div>
    </div>
    
    <!-- 数据统计模块 -->
    <div class="stats-section">
      <div class="stats-card mood-distribution">
        <h3>心情分布</h3>
        <div class="mood-stats">
          <div class="mood-item">
            <div class="mood-icon">😊</div>
            <div class="mood-info">
              <span class="mood-label">开心</span>
              <span class="mood-percent">45%</span>
            </div>
          </div>
          <div class="mood-item">
            <div class="mood-icon">😢</div>
            <div class="mood-info">
              <span class="mood-label">难过</span>
              <span class="mood-percent">25%</span>
            </div>
          </div>
          <div class="mood-item">
            <div class="mood-icon">😐</div>
            <div class="mood-info">
              <span class="mood-label">平静</span>
              <span class="mood-percent">30%</span>
            </div>
          </div>
        </div>
      </div>
      
      <div class="stats-card activity-chart">
        <h3>本月活跃度</h3>
        <div class="activity-bars">
          <div 
            v-for="(day, index) in activityData" 
            :key="index"
            class="activity-day"
          >
            <div class="bar-container">
              <div 
                class="activity-bar" 
                :style="{ height: day.height }"
              ></div>
            </div>
            <div class="day-label">{{ day.date }}</div>
            <div class="count-label">{{ day.count }}</div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- 日记列表模块 -->
    <div class="diary-list-section">
      <div class="section-header">
        <h2>我的日记</h2>
        <div class="result-count">共找到 {{ filteredDiaries.length }} 篇日记</div>
      </div>
      
      <div class="diary-grid">
        <div 
          v-for="diary in filteredDiaries" 
          :key="diary.id"
          class="diary-card"
        >
          <div class="diary-card-header">
            <h3 class="diary-title">{{ diary.title }}</h3>
            <div class="diary-date">{{ diary.date }}</div>
          </div>
          <div class="diary-content">
            {{ diary.preview }}
          </div>
          <div class="diary-tags">
            <span 
              v-for="tag in diary.tags" 
              :key="tag" 
              class="tag"
              :class="getTagClass(tag)"
            >
              {{ tag }}
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'DiaryList',
  data() {
    return {
      filters: {
        mood: '',
        date: '',
        timeRange: 'all',
        keyword: ''
      },
      timeRanges: [
        { label: '近一周', value: 'week' },
        { label: '本月', value: 'month' },
        { label: '全部', value: 'all' }
      ],
      activityData: [
        { date: '1', count: 2, height: '80%' },
        { date: '2', count: 0, height: '0%' },
        { date: '3', count: 1, height: '40%' },
        { date: '4', count: 3, height: '100%' },
        { date: '5', count: 1, height: '40%' },
        { date: '6', count: 2, height: '80%' },
        { date: '7', count: 0, height: '0%' },
        { date: '8', count: 1, height: '40%' },
        { date: '9', count: 2, height: '80%' },
        { date: '10', count: 1, height: '40%' }
      ],
      diaries: [
        {
          id: 1,
          title: '美好的一天',
          date: '2025-11-04',
          preview: '今天阳光明媚，心情特别好。早上去了公园散步，看到了很多美丽的花朵...',
          tags: ['生活', '心情'],
          mood: 'happy'
        },
        {
          id: 2,
          title: '工作中的挑战',
          date: '2025-11-03',
          preview: '今天遇到了一个技术难题，花了一整天的时间才解决。虽然过程很辛苦，但最终...',
          tags: ['工作', '反思'],
          mood: 'calm'
        },
        {
          id: 3,
          title: '与朋友的聚会',
          date: '2025-11-02',
          preview: '周末和几个老朋友聚餐，聊了很多过去的趣事。感觉友谊真的是人生中最宝贵的...',
          tags: ['社交', '回忆'],
          mood: 'happy'
        },
        {
          id: 4,
          title: '学习新技能',
          date: '2025-11-01',
          preview: '开始学习Vue.js，感觉这个框架真的很强大。虽然有些概念还不太理解，但我相信...',
          tags: ['学习', '成长'],
          mood: 'excited'
        },
        {
          id: 5,
          title: '雨天的思考',
          date: '2025-10-30',
          preview: '今天下雨一整天，适合在家里静静地思考。回想最近的生活，有很多值得感恩...',
          tags: ['思考', '生活'],
          mood: 'calm'
        },
        {
          id: 6,
          title: '健身计划',
          date: '2025-10-28',
          preview: '制定了一个新的健身计划，希望能在两个月内达到目标体重。今天开始了第一...',
          tags: ['健身', '计划'],
          mood: 'excited'
        }
      ]
    }
  },
  computed: {
    filteredDiaries() {
      let result = this.diaries;
      
      // 根据心情筛选
      if (this.filters.mood) {
        result = result.filter(diary => diary.mood === this.filters.mood);
      }
      
      // 根据日期筛选
      if (this.filters.date) {
        result = result.filter(diary => diary.date === this.filters.date);
      }
      
      // 根据关键词筛选
      if (this.filters.keyword) {
        const keyword = this.filters.keyword.toLowerCase();
        result = result.filter(diary => 
          diary.title.toLowerCase().includes(keyword) || 
          diary.preview.toLowerCase().includes(keyword)
        );
      }
      
      // 根据时间范围筛选
      if (this.filters.timeRange !== 'all') {
        const now = new Date();
        result = result.filter(diary => {
          const diaryDate = new Date(diary.date);
          if (this.filters.timeRange === 'week') {
            const weekAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000);
            return diaryDate >= weekAgo && diaryDate <= now;
          } else if (this.filters.timeRange === 'month') {
            return diaryDate.getMonth() === now.getMonth() && 
                   diaryDate.getFullYear() === now.getFullYear();
          }
          return true;
        });
      }
      
      return result;
    }
  },
  methods: {
    setTimeRange(range) {
      this.filters.timeRange = range;
    },
    searchDiaries() {
      // 搜索会在computed属性中自动处理
    },
    clearFilters() {
      this.filters = {
        mood: '',
        date: '',
        timeRange: 'all',
        keyword: ''
      };
    },
    goToCreateDiary() {
      this.$router.push('/createDiary');
    },
    getTagClass(tag) {
      const tagClasses = {
        '生活': 'tag-life',
        '心情': 'tag-mood',
        '工作': 'tag-work',
        '反思': 'tag-reflection',
        '社交': 'tag-social',
        '回忆': 'tag-memory',
        '学习': 'tag-study',
        '成长': 'tag-growth',
        '思考': 'tag-thought',
        '健身': 'tag-fitness',
        '计划': 'tag-plan'
      };
      return tagClasses[tag] || '';
    }
  }
}
</script>

<style scoped>
.diary-list-page {
  /* 低饱和柔和渐变：浅紫灰+柔粉棕+暖米黄，模拟记忆的温润感 */
  background: linear-gradient(135deg, rgba(180, 170, 190, 0.85), rgba(220, 200, 190, 0.85), rgba(245, 235, 220, 0.85));
  color: #333333; /* 深灰色文字，提高与背景的对比度 */
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  padding: 2rem;
  min-height: 100vh;
  /* 渐变过渡自然，保留轻微流动感但更柔和 */
  background-size: 200% 200%;
  animation: gradientFlow 20s ease infinite; /* 放慢动画速度，更舒缓 */
  border-radius: 24px;
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

/* 顶部操作栏 */
.toolbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: rgba(255, 255, 255, 0.3);
  backdrop-filter: blur(10px);
  border-radius: 15px;
  padding: 1rem 1.5rem;
  margin-bottom: 2rem;
  border: 1px solid rgba(255, 255, 255, 0.1);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}

.toolbar-left {
  display: flex;
  align-items: center;
  gap: 1rem;
}

.filter-group {
  display: flex;
  align-items: center;
}

.filter-select,
.date-picker {
  padding: 0.5rem;
  border: 1px solid #ddd;
  border-radius: 5px;
  background: rgba(255, 255, 255, 0.7);
  margin-right: 0.5rem;
}

.time-range-buttons {
  display: flex;
  gap: 0.5rem;
}

.time-range-btn {
  padding: 0.5rem 1rem;
  border: 1px solid #ddd;
  border-radius: 20px;
  background: rgba(255, 255, 255, 0.7);
  cursor: pointer;
  transition: all 0.3s ease;
}

.time-range-btn:hover {
  background: rgba(236, 240, 241, 0.9);
}

.time-range-btn.active {
  background: #3498db;
  color: white;
  border-color: #3498db;
}

.toolbar-center {
  display: flex;
  align-items: center;
  gap: 1rem;
}

.search-box {
  display: flex;
  align-items: center;
}

.search-input {
  padding: 0.5rem;
  border: 1px solid #ddd;
  border-radius: 5px 0 0 5px;
  background: rgba(255, 255, 255, 0.7);
  width: 200px;
}

.search-button {
  padding: 0.5rem 1rem;
  border: 1px solid #ddd;
  border-left: none;
  border-radius: 0 5px 5px 0;
  background: #3498db;
  color: white;
  cursor: pointer;
}

.clear-button {
  padding: 0.5rem 1rem;
  border: 1px solid #ddd;
  border-radius: 5px;
  background: rgba(255, 255, 255, 0.7);
  cursor: pointer;
}

.toolbar-right .btn-primary {
  padding: 0.8rem 1.5rem;
  border: none;
  border-radius: 8px;
  background: linear-gradient(135deg, #3498db, #2980b9);
  color: white;
  font-weight: bold;
  cursor: pointer;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
}

.toolbar-right .btn-primary:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
}

/* 数据统计模块 */
.stats-section {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 1.5rem;
  margin-bottom: 2rem;
}

.stats-card {
  background: rgba(255, 255, 255, 0.3);
  backdrop-filter: blur(10px);
  border-radius: 15px;
  padding: 1.5rem;
  border: 1px solid rgba(255, 255, 255, 0.1);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}

.stats-card h3 {
  margin-top: 0;
  color: #2c3e50;
  border-bottom: 1px solid rgba(0, 0, 0, 0.1);
  padding-bottom: 0.5rem;
}

.mood-stats {
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.mood-item {
  display: flex;
  align-items: center;
  gap: 1rem;
}

.mood-icon {
  font-size: 1.5rem;
}

.mood-info {
  display: flex;
  justify-content: space-between;
  flex-grow: 1;
}

.mood-label {
  font-weight: bold;
}

.mood-percent {
  color: #3498db;
  font-weight: bold;
}

.activity-bars {
  display: flex;
  justify-content: space-around;
  align-items: flex-end;
  height: 150px;
  padding: 1rem 0;
}

.activity-day {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.5rem;
}

.bar-container {
  height: 100px;
  display: flex;
  align-items: flex-end;
}

.activity-bar {
  width: 20px;
  background: linear-gradient(to top, #3498db, #2980b9);
  border-radius: 3px 3px 0 0;
}

.day-label {
  font-size: 0.8rem;
  color: #7f8c8d;
}

.count-label {
  font-size: 0.8rem;
  font-weight: bold;
  color: #2c3e50;
}

/* 日记列表模块 */
.diary-list-section {
  background: rgba(255, 255, 255, 0.3);
  backdrop-filter: blur(10px);
  border-radius: 15px;
  padding: 1.5rem;
  border: 1px solid rgba(255, 255, 255, 0.1);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}

.section-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 1.5rem;
}

.section-header h2 {
  margin: 0;
  color: #2c3e50;
}

.result-count {
  color: #7f8c8d;
  font-size: 0.9rem;
}

.diary-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 1.5rem;
}

.diary-card {
  background: rgba(255, 255, 255, 0.5);
  border-radius: 10px;
  padding: 1.5rem;
  cursor: pointer;
  transition: all 0.3s ease;
  border: 1px solid rgba(255, 255, 255, 0.3);
}

.diary-card:hover {
  transform: translateY(-5px);
  background: rgba(255, 255, 255, 0.9);
  box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
}

.diary-card-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-bottom: 1rem;
}

.diary-title {
  margin: 0;
  color: #2c3e50;
  font-size: 1.2rem;
}

.diary-date {
  font-size: 0.85rem;
  color: #7f8c8d;
  white-space: nowrap;
}

.diary-content {
  color: #34495e;
  margin-bottom: 1rem;
  line-height: 1.5;
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.diary-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
}

.tag {
  padding: 0.3rem 0.8rem;
  border-radius: 15px;
  font-size: 0.8rem;
  font-weight: bold;
}

.tag-life {
  background: rgba(52, 152, 219, 0.2);
  color: #3498db;
  border: 1px solid rgba(52, 152, 219, 0.3);
}

.tag-mood {
  background: rgba(230, 126, 34, 0.2);
  color: #e67e22;
  border: 1px solid rgba(230, 126, 34, 0.3);
}

.tag-work {
  background: rgba(46, 204, 113, 0.2);
  color: #2ecc71;
  border: 1px solid rgba(46, 204, 113, 0.3);
}

.tag-reflection {
  background: rgba(155, 89, 182, 0.2);
  color: #9b59b6;
  border: 1px solid rgba(155, 89, 182, 0.3);
}

.tag-social {
  background: rgba(241, 196, 15, 0.2);
  color: #f1c40f;
  border: 1px solid rgba(241, 196, 15, 0.3);
}

.tag-memory {
  background: rgba(230, 126, 34, 0.2);
  color: #e67e22;
  border: 1px solid rgba(230, 126, 34, 0.3);
}

.tag-study {
  background: rgba(52, 152, 219, 0.2);
  color: #3498db;
  border: 1px solid rgba(52, 152, 219, 0.3);
}

.tag-growth {
  background: rgba(46, 204, 113, 0.2);
  color: #2ecc71;
  border: 1px solid rgba(46, 204, 113, 0.3);
}

.tag-thought {
  background: rgba(149, 165, 166, 0.2);
  color: #95a5a6;
  border: 1px solid rgba(149, 165, 166, 0.3);
}

.tag-fitness {
  background: rgba(231, 76, 60, 0.2);
  color: #e74c3c;
  border: 1px solid rgba(231, 76, 60, 0.3);
}

.tag-plan {
  background: rgba(155, 89, 182, 0.2);
  color: #9b59b6;
  border: 1px solid rgba(155, 89, 182, 0.3);
}

@media (max-width: 1200px) {
  .toolbar {
    flex-direction: column;
    gap: 1rem;
  }
  
  .toolbar-left,
  .toolbar-center,
  .toolbar-right {
    width: 100%;
    justify-content: center;
  }
  
  .stats-section {
    grid-template-columns: 1fr;
  }
}

@media (max-width: 768px) {
  .diary-list-page {
    padding: 1rem;
  }
  
  .toolbar {
    padding: 1rem;
  }
  
  .search-input {
    width: 150px;
  }
  
  .diary-grid {
    grid-template-columns: 1fr;
  }
}
</style>