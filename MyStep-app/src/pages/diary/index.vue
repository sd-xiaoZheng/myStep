<script lang="ts" setup>
import { ref, computed } from 'vue'

defineOptions({
  name: 'DiaryHome',
})

definePage({
  type: 'page',
  style: {
    navigationStyle: 'custom',
    navigationBarTitleText: '日记',
  },
})

// 获取当前日期信息
const currentDate = computed(() => {
  const now = new Date()
  const year = now.getFullYear()
  const month = now.getMonth() + 1
  const day = now.getDate()
  return `${year} 年 ${month} 月 ${day} 日`
})

// 根据时间段返回问候语
const greeting = computed(() => {
  const hour = new Date().getHours()
  if (hour >= 0 && hour < 6) return '夜深了，注意休息'
  if (hour >= 6 && hour < 9) return '早安，新的一天'
  if (hour >= 9 && hour < 12) return '上午好，精神满满'
  if (hour >= 12 && hour < 14) return '中午好，记得休息'
  if (hour >= 14 && hour < 18) return '下午好，继续加油'
  if (hour >= 18 && hour < 22) return '晚上好，放松心情'
  return '夜深了，注意休息'
})

// 统计数据
const stats = ref({
  monthlyCount: 13,
  streakDays: 7
})

// 待办事项列表
const todoList = ref([
  { id: 1, text: '记录今天的美好瞬间', completed: false },
  { id: 2, text: '写一篇心情日记', completed: false },
  { id: 3, text: '回顾本周的成长', completed: true }
])

// 新建日记
const handleNewDiary = () => {
  uni.navigateTo({
    url: '/pages/diary/write'
  })
}

// 心情记录
const handleMood = () => {
  uni.showToast({
    title: '记录心情',
    icon: 'none'
  })
}

// 跳转到写日记页面
const goToWrite = () => {
  uni.navigateTo({
    url: '/pages/diary/write'
  })
}

// 跳转到阅读页面
const goToRead = () => {
  uni.navigateTo({
    url: '/pages/diary/read'
  })
}

// 底部导航项
const tabbarItems = ref([
  { id: 'home', title: '首页', icon: 'i-carbon-home', path: '/pages/index/index' },
  { id: 'diary', title: '日记', icon: 'i-carbon-document', path: '/pages/diary/index', active: true },
  { id: 'write', title: '写日记', icon: 'i-carbon-add', path: '/pages/diary/write' },
  { id: 'read', title: '阅读', icon: 'i-carbon-book', path: '/pages/diary/read' }
])

// 切换导航
const switchTab = (item) => {
  if (item.id === 'home') {
    uni.switchTab({
      url: item.path
    })
  } else {
    uni.navigateTo({
      url: item.path
    })
  }
}
</script>

<template>
  <view class="diary-container">
    <!-- 顶部欢迎区 -->
    <view class="header-section">
      <view class="header-content">
        <view class="greeting-area">
          <text class="greeting-text">{{ greeting }}</text>
          <text class="date-text">今天是 {{ currentDate }}</text>
        </view>
        <view class="header-actions">
          <view class="tag-pill">✦ 留下今日点滴 ✦</view>
        </view>
      </view>
    </view>

    <!-- 操作按钮区 -->
    <view class="action-section">
      <view class="action-buttons">
        <view class="btn-primary" @click="handleNewDiary">
          <view class="i-carbon-add btn-icon"></view>
          <text class="btn-text">新建日记</text>
        </view>
        <view class="btn-secondary" @click="handleMood">
          <view class="i-carbon-face-satisfied btn-icon"></view>
          <text class="btn-text">心情</text>
        </view>
      </view>
    </view>

    <!-- 统计卡片 -->
    <view class="stats-section">
      <view class="stats-cards">
        <view class="stat-card">
          <view class="stat-header">
            <view class="stat-icon-wrapper blue">
              <view class="i-carbon-document stat-icon"></view>
            </view>
            <text class="stat-label">本月篇数</text>
          </view>
          <text class="stat-number blue">{{ stats.monthlyCount }}</text>
          <text class="stat-unit">篇日记 📖</text>
        </view>
        <view class="stat-card">
          <view class="stat-header">
            <view class="stat-icon-wrapper orange">
              <view class="i-carbon-fire stat-icon"></view>
            </view>
            <text class="stat-label">连续写作</text>
          </view>
          <text class="stat-number orange">{{ stats.streakDays }}</text>
          <text class="stat-unit">天 🔥</text>
        </view>
      </view>
    </view>

    <!-- 待办事项区 -->
    <view class="todo-section">
      <view class="todo-card">
        <view class="todo-header">
          <view class="todo-title-area">
            <view class="i-carbon-task todo-icon"></view>
            <text class="todo-title">今日待办</text>
          </view>
          <view class="todo-count">{{ todoList.filter(t => !t.completed).length }}</view>
        </view>
        
        <!-- 输入框 -->
        <view class="todo-input-area">
          <view class="todo-input">
            <text class="placeholder-text">记录想做的事...</text>
          </view>
          <view class="add-btn">添加</view>
        </view>

        <!-- 待办列表 -->
        <view class="todo-list">
          <view 
            v-for="item in todoList" 
            :key="item.id" 
            class="todo-item"
          >
            <view class="checkbox" :class="{ checked: item.completed }">
              <view v-if="item.completed" class="i-carbon-checkmark check-icon"></view>
            </view>
            <text class="todo-text" :class="{ completed: item.completed }">{{ item.text }}</text>
          </view>
        </view>
      </view>
    </view>

    <!-- 底部导航栏 -->
    <view class="tabbar">
      <view 
        v-for="item in tabbarItems" 
        :key="item.id"
        class="tabbar-item"
        :class="{ active: item.active }"
        @click="switchTab(item)"
      >
        <view :class="[item.icon, 'tabbar-icon']"></view>
        <text class="tabbar-text">{{ item.title }}</text>
      </view>
    </view>
  </view>
</template>

<style scoped lang="scss">
.diary-container {
  min-height: 100vh;
  background: linear-gradient(135deg, 
    rgba(200, 185, 215, 0.9), 
    rgba(235, 210, 200, 0.9), 
    rgba(250, 238, 220, 0.9));
  padding-bottom: 80px;
  padding-top: env(safe-area-inset-top);
}

/* 顶部欢迎区 */
.header-section {
  padding: 20px 20px 0;
}

.header-content {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.greeting-area {
  display: flex;
  flex-direction: column;
  gap: 2px;
}

.greeting-text {
  font-size: 12px;
  font-weight: 400;
  line-height: 16px;
  color: rgba(150, 138, 155, 1);
}

.date-text {
  font-size: 20px;
  font-weight: 700;
  line-height: 28px;
  color: rgba(45, 38, 55, 1);
}

.header-actions {
  padding-top: 8px;
}

.tag-pill {
  display: inline-block;
  padding: 5px 13px;
  background-color: rgba(255, 255, 255, 0.6);
  border-radius: 999px;
  border: 1px solid rgba(220, 210, 200, 0.5);
  font-size: 12px;
  color: rgba(100, 88, 110, 1);
  line-height: 16px;
}

/* 操作按钮区 */
.action-section {
  padding: 16px 20px;
}

.action-buttons {
  display: flex;
  gap: 12px;
}

.btn-primary {
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  height: 48px;
  background: linear-gradient(135deg, rgba(52, 152, 219, 1), rgba(41, 128, 185, 1));
  border-radius: 12px;
  box-shadow: 0px 4px 16px rgba(52, 152, 219, 0.35);
}

.btn-secondary {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  width: 86px;
  height: 48px;
  background: linear-gradient(135deg, rgba(142, 68, 173, 1), rgba(120, 55, 150, 1));
  border-radius: 12px;
  box-shadow: 0px 4px 16px rgba(142, 68, 173, 0.3);
}

.btn-icon {
  font-size: 18px;
  color: rgba(255, 255, 255, 1);
}

.btn-text {
  font-size: 14px;
  font-weight: 700;
  color: rgba(255, 255, 255, 1);
  line-height: 20px;
}

/* 统计卡片 */
.stats-section {
  padding: 0 20px 16px;
}

.stats-cards {
  display: flex;
  gap: 12px;
}

.stat-card {
  flex: 1;
  padding: 17px;
  background-color: rgba(255, 252, 248, 0.72);
  border-radius: 16px;
  box-shadow: 0px 1px 4px rgba(100, 80, 120, 0.05), 0px 4px 24px rgba(100, 80, 120, 0.08);
  border: 1px solid rgba(255, 255, 255, 0.55);
}

.stat-header {
  display: flex;
  align-items: center;
  gap: 8px;
  margin-bottom: 8px;
}

.stat-icon-wrapper {
  width: 28px;
  height: 28px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 16px;
  
  &.blue {
    background-color: rgba(52, 152, 219, 0.15);
  }
  
  &.orange {
    background-color: rgba(231, 76, 60, 0.12);
  }
}

.stat-icon {
  font-size: 14px;
  color: rgba(52, 152, 219, 1);
}

.stat-icon-wrapper.orange .stat-icon {
  color: rgba(231, 76, 60, 1);
}

.stat-label {
  font-size: 12px;
  font-weight: 400;
  line-height: 16px;
  color: rgba(150, 138, 155, 1);
}

.stat-number {
  font-size: 30px;
  font-weight: 700;
  line-height: 36px;
  
  &.blue {
    background: linear-gradient(90deg, rgba(52, 152, 219, 1), rgba(142, 68, 173, 1));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
  }
  
  &.orange {
    background: linear-gradient(90deg, rgba(231, 76, 60, 1), rgba(230, 126, 34, 1));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
  }
}

.stat-unit {
  font-size: 12px;
  font-weight: 400;
  line-height: 16px;
  color: rgba(150, 138, 155, 1);
  margin-top: 4px;
  display: block;
}

/* 待办事项区 */
.todo-section {
  padding: 0 20px 16px;
}

.todo-card {
  background-color: rgba(255, 252, 248, 0.72);
  border-radius: 16px;
  padding: 17px;
  box-shadow: 0px 1px 4px rgba(100, 80, 120, 0.05), 0px 4px 24px rgba(100, 80, 120, 0.08);
  border: 1px solid rgba(255, 255, 255, 0.55);
}

.todo-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 12px;
}

.todo-title-area {
  display: flex;
  align-items: center;
  gap: 8px;
}

.todo-icon {
  font-size: 16px;
  color: rgba(45, 38, 55, 1);
}

.todo-title {
  font-size: 14px;
  font-weight: 700;
  line-height: 20px;
  color: rgba(45, 38, 55, 1);
}

.todo-count {
  padding: 2px 8px;
  background-color: rgba(52, 152, 219, 0.12);
  border-radius: 999px;
  font-size: 12px;
  color: rgba(52, 152, 219, 1);
}

.todo-input-area {
  display: flex;
  gap: 8px;
  margin-bottom: 8px;
}

.todo-input {
  flex: 1;
  height: 38px;
  padding: 0 12px;
  background-color: rgba(245, 240, 235, 0.8);
  border-radius: 12px;
  border: 1px solid rgba(220, 210, 200, 0.7);
  display: flex;
  align-items: center;
}

.placeholder-text {
  font-size: 14px;
  color: rgba(45, 38, 55, 0.5);
}

.add-btn {
  width: 52px;
  height: 38px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(135deg, rgba(52, 152, 219, 1), rgba(41, 128, 185, 1));
  border-radius: 12px;
  box-shadow: 0px 4px 16px rgba(52, 152, 219, 0.35);
  font-size: 14px;
  color: rgba(255, 255, 255, 1);
}

.todo-list {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.todo-item {
  display: flex;
  align-items: center;
  gap: 12px;
  height: 24px;
}

.checkbox {
  width: 20px;
  height: 20px;
  border-radius: 10px;
  border: 1px solid rgba(200, 190, 210, 1);
  display: flex;
  align-items: center;
  justify-content: center;
  
  &.checked {
    background-color: rgba(52, 152, 219, 1);
    border-color: rgba(52, 152, 219, 1);
  }
}

.check-icon {
  font-size: 12px;
  color: #fff;
}

.todo-text {
  font-size: 14px;
  line-height: 22px;
  color: rgba(60, 50, 70, 1);
  
  &.completed {
    color: rgba(150, 138, 155, 0.6);
    text-decoration: line-through;
  }
}

/* 底部导航栏 */
.tabbar {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  height: 60px;
  background-color: rgba(255, 255, 255, 0.95);
  display: flex;
  align-items: center;
  justify-content: space-around;
  padding-bottom: env(safe-area-inset-bottom);
  box-shadow: 0px -2px 10px rgba(0, 0, 0, 0.05);
  backdrop-filter: blur(10px);
}

.tabbar-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 4px;
  padding: 8px 16px;
  
  &.active {
    .tabbar-icon {
      color: rgba(52, 152, 219, 1);
    }
    .tabbar-text {
      color: rgba(52, 152, 219, 1);
    }
  }
}

.tabbar-icon {
  font-size: 24px;
  color: rgba(150, 138, 155, 1);
}

.tabbar-text {
  font-size: 10px;
  color: rgba(150, 138, 155, 1);
}
</style>
