<template>
  <div class="diary-list-page">
    <!-- 顶部操作栏 -->
    <div class="toolbar">
      <div class="toolbar-left">

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
        <div class="selected-filters">
          <span
            v-for="(item, index) in activeFilterItems"
            :key="item._key"
            :class="['selected-filter-bubble', { 'flash-highlight': item._flash }]"
            :style="getBubbleStyle(item)"
            @mouseenter="item._hover = true"
            @mouseleave="item._hover = false"
            @click="removeFilter(index)"
          >
            {{ item.displayName }}
            <span v-if="item._hover" class="remove-x">&times;</span>
          </span>
          <span
            v-if="activeFilterItems.length > 0"
            class="selected-filter-clear"
            @click="clearBubbleFilters"
          >清除</span>
        </div>
        <div class="result-count">共找到 {{ filteredDiaries.length }} 篇日记</div>
      </div>

      <!-- 可选筛选气泡行 -->
      <div
        class="filter-bubble-row"
        ref="bubbleRow"
        @mouseenter="pauseScroll"
        @mouseleave="resumeScroll"
      >
        <span
          v-for="item in availableFilterItems"
          :key="item._category + '_' + item.id"
          :class="['filter-bubble', { active: isFilterActive(item) }]"
          :style="getBubbleStyle(item)"
          @click="toggleFilter(item)"
        >{{ item.displayName }}</span>
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
          <div class="diary-meta">
            <span v-if="diary.weatherName" class="meta-text weather">{{ diary.weatherName }}</span>
            <span v-if="diary.typeName" class="meta-text type">{{ diary.typeName }}</span>
            <div v-if="diary.tags && diary.tags.length > 0" class="tags-container">
              <span
                v-for="tag in diary.tags"
                :key="tag.id || tag.name"
                class="tag"
                :style="{ backgroundColor: tag.color || '#FFF000', color: '#333' }"
              >
                {{ tag.name }}
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { getDiaryList } from '@/apis/api/diary'
import { getFiltter } from '@/apis/api/article'

let _keyCounter = 0

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
      filterOptions: {
        weather: [],
        mood: [],
        type: [],
        tag: []
      },
      activeFilterItems: [],
      timeRanges: [
        { label: '全部', value: 'all' },
        { label: '今年', value: 'year' },
        { label: '本月', value: 'month' }
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
      diaries: []
    }
  },
  computed: {
    filteredDiaries() {
      let result = this.diaries;

      if (this.filters.mood) {
        result = result.filter(diary => diary.mood === this.filters.mood);
      }

      if (this.filters.date) {
        result = result.filter(diary => diary.date === this.filters.date);
      }

      if (this.filters.keyword) {
        const keyword = this.filters.keyword.toLowerCase();
        result = result.filter(diary =>
          diary.title.toLowerCase().includes(keyword) ||
          diary.preview.toLowerCase().includes(keyword)
        );
      }

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

      if (this.activeFilterItems.length > 0) {
        result = result.filter(diary => {
          return this.activeFilterItems.some(f => {
            switch (f._category) {
              case 'weather': return diary.weatherId === f.id
              case 'mood': return diary.moodId === f.id
              case 'type': return diary.typeId === f.id
              case 'tag': return diary.tags && diary.tags.some(t => (t.id || t.tagId) === f.id)
              default: return false
            }
          })
        })
      }

      return result;
    },
    allFilterItems() {
      const items = []
      this.filterOptions.weather.forEach(w => {
        items.push({ ...w, displayName: w.label, _category: 'weather' })
      })
      this.filterOptions.mood.forEach(m => {
        items.push({ ...m, displayName: m.name, _category: 'mood' })
      })
      this.filterOptions.type.forEach(t => {
        items.push({ ...t, displayName: t.name, _category: 'type' })
      })
      this.filterOptions.tag.forEach(t => {
        items.push({ ...t, displayName: t.name, _category: 'tag' })
      })
      for (let i = items.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [items[i], items[j]] = [items[j], items[i]]
      }
      return items
    },
    availableFilterItems() {
      const activeSet = new Set(this.activeFilterItems.map(i => i._category + '_' + i.id))
      return this.allFilterItems.filter(item => !activeSet.has(item._category + '_' + item.id))
    }
  },
  async mounted() {
    await Promise.all([this.loadDiaryList(), this.loadFilterOptions()])
    this.$nextTick(() => {
      this.startAutoScroll()
    })
  },
  beforeDestroy() {
    this.stopAutoScroll()
  },
  methods: {
    async loadFilterOptions() {
      try {
        const res = await getFiltter()
        if (res.code === 200 && res.data) {
          this.filterOptions = {
            weather: res.data.weather || [],
            mood: res.data.mood || [],
            type: res.data.type || [],
            tag: res.data.tag || []
          }
        }
      } catch (error) {
        console.error('获取筛选条件失败:', error)
      }
    },
    isFilterActive(item) {
      return this.activeFilterItems.some(f => f._category === item._category && f.id === item.id)
    },
    getBubbleStyle(item) {
      if (item.color) {
        return { background: item.color, color: '#333' }
      }
      return {}
    },
    toggleFilter(item) {
      const idx = this.activeFilterItems.findIndex(f => f._category === item._category && f.id === item.id)
      if (idx >= 0) {
        this.$set(this.activeFilterItems[idx], '_flash', true)
        this.$nextTick(() => {
          setTimeout(() => {
            this.$set(this.activeFilterItems[idx], '_flash', false)
          }, 1500)
        })
      } else {
        const newItem = { ...item, _key: item._category + '_' + item.id + '_' + (++_keyCounter), _hover: false, _flash: false }
        if (this.activeFilterItems.length >= 20) {
          this.activeFilterItems.shift()
        }
        this.activeFilterItems.push(newItem)
      }
    },
    removeFilter(index) {
      this.activeFilterItems.splice(index, 1)
    },
    clearBubbleFilters() {
      this.activeFilterItems = []
    },
    startAutoScroll() {
      const el = this.$refs.bubbleRow
      if (!el) return
      this._scrollSpeed = 1
      this._scrollPaused = false
      this._scrollTimer = setInterval(() => {
        if (this._scrollPaused) return
        if (el.scrollLeft >= el.scrollWidth - el.clientWidth) {
          el.scrollLeft = 0
        } else {
          el.scrollLeft += this._scrollSpeed
        }
      }, 30)
    },
    stopAutoScroll() {
      if (this._scrollTimer) {
        clearInterval(this._scrollTimer)
        this._scrollTimer = null
      }
    },
    pauseScroll() {
      this._scrollPaused = true
    },
    resumeScroll() {
      this._scrollPaused = false
    },
    async loadDiaryList() {
      try {
        const res = await getDiaryList()
        if (res.code === 200 && res.rows) {
          this.diaries = res.rows.map(item => ({
            id: item.id,
            title: item.title,
            date: item.memoryTime ? item.memoryTime.split('T')[0] : '',
            preview: item.content,
            tags: item.tags,
            mood: 'calm',
            color: item.color,
            typeName: item.typeName,
            weatherName: item.weatherName,
            moodName: item.moodName,
            typeId: item.typeId,
            weatherId: item.weatherId,
            moodId: item.moodId
          }))
        }
      } catch (error) {
        console.error('获取日记列表失败:', error)
      }
    },
    setTimeRange(range) {
      this.filters.timeRange = range;
    },
    searchDiaries() {
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
      this.$router.push('/diaryCreate');
    }
  }
}
</script>

<style scoped>
.diary-list-page {
  background: linear-gradient(135deg, rgba(180, 170, 190, 0.85), rgba(220, 200, 190, 0.85), rgba(245, 235, 220, 0.85));
  color: #333333;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  padding: 2rem;
  min-height: 100vh;
  background-size: 200% 200%;
  animation: gradientFlow 20s ease infinite;
  border-radius: 24px;
}

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
  align-items: center;
  gap: 0.8rem;
  margin-bottom: 1rem;
  flex-wrap: wrap;
}

.section-header h2 {
  margin: 0;
  color: #2c3e50;
  flex-shrink: 0;
}

.selected-filters {
  display: flex;
  align-items: center;
  gap: 0.4rem;
  flex: 1;
  flex-wrap: wrap;
  min-width: 0;
}

.selected-filter-bubble {
  display: inline-flex;
  align-items: center;
  gap: 0.25rem;
  padding: 0.25rem 0.6rem;
  border-radius: 15px;
  font-size: 0.78rem;
  background: #3498db;
  color: #fff;
  cursor: pointer;
  flex-shrink: 0;
  user-select: none;
  border: 1px solid rgba(0, 0, 0, 0.05);
}

.selected-filter-bubble .remove-x {
  font-size: 1rem;
  font-weight: bold;
  line-height: 1;
  opacity: 0.8;
}

.selected-filter-bubble .remove-x:hover {
  opacity: 1;
}

.selected-filter-bubble.flash-highlight {
  animation: flashBubble 0.5s ease-in-out 3;
}

@keyframes flashBubble {
  0%, 100% { box-shadow: 0 0 0 0 rgba(52, 152, 219, 0.4); transform: scale(1); }
  50% { box-shadow: 0 0 12px 6px rgba(52, 152, 219, 0.9); transform: scale(1.1); }
}

.selected-filter-clear {
  font-size: 0.75rem;
  color: #e74c3c;
  cursor: pointer;
  flex-shrink: 0;
  user-select: none;
  padding: 0.2rem 0.4rem;
  border-radius: 10px;
}

.selected-filter-clear:hover {
  background: rgba(231, 76, 60, 0.1);
}

.result-count {
  color: #7f8c8d;
  font-size: 0.9rem;
  flex-shrink: 0;
  margin-left: auto;
}

/* 筛选气泡行 */
.filter-bubble-row {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.6rem 0;
  margin-bottom: 1.2rem;
  overflow-x: auto;
  overflow-y: hidden;
  white-space: nowrap;
  scrollbar-width: none;
  -ms-overflow-style: none;
}

.filter-bubble-row::-webkit-scrollbar {
  display: none;
}

.filter-bubble {
  display: inline-flex;
  align-items: center;
  padding: 0.35rem 0.85rem;
  border-radius: 20px;
  font-size: 0.82rem;
  background: rgba(255, 255, 255, 0.7);
  border: 1px solid rgba(0, 0, 0, 0.08);
  cursor: pointer;
  flex-shrink: 0;
  transition: all 0.25s ease;
  user-select: none;
  color: #555;
}

.filter-bubble:hover {
  border-color: rgba(0, 0, 0, 0.15);
  transform: translateY(-1px);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
}

.filter-bubble.active {
  background: #3498db !important;
  color: #fff !important;
  border-color: #3498db;
  font-weight: bold;
  box-shadow: 0 2px 10px rgba(52, 152, 219, 0.3);
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

.diary-meta {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 0.6rem;
  margin-top: 1rem;
  padding-top: 1rem;
  border-top: 1px solid rgba(0, 0, 0, 0.05);
}

.meta-text {
  font-size: 0.85rem;
  padding: 0.25rem 0.5rem;
  border-radius: 4px;
  background: transparent;
}

.meta-text.weather {
  color: #e67e22;
  font-weight: bold;
}

.meta-text.type {
  color: #3498db;
  font-weight: bold;
}

.tags-container {
  display: flex;
  flex-wrap: wrap;
  gap: 0.4rem;
  margin-left: auto;
}

.tag {
  padding: 0.3rem 0.8rem;
  border-radius: 15px;
  font-size: 0.8rem;
  font-weight: bold;
  transition: all 0.3s ease;
  border: 1px solid rgba(0, 0, 0, 0.05);
}

.tag:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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
