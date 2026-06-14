<script lang="ts" setup>
import { ref } from 'vue'

defineOptions({
  name: 'DiaryRead',
})

definePage({
  type: 'page',
  style: {
    navigationStyle: 'custom',
    navigationBarTitleText: '阅读日记',
  },
})

// 模拟日记列表数据
const diaryList = ref([
  {
    id: 1,
    date: '2026年5月14日',
    mood: '😊',
    title: '美好的一天',
    content: '今天天气很好，和朋友一起去了公园...',
    weather: '晴天'
  },
  {
    id: 2,
    date: '2026年5月13日',
    mood: '😌',
    title: '平静的周末',
    content: '在家看书，享受宁静的时光...',
    weather: '多云'
  },
  {
    id: 3,
    date: '2026年5月12日',
    mood: '😢',
    title: '下雨天',
    content: '今天下雨了，心情有点低落...',
    weather: '雨天'
  }
])

const viewDetail = (item) => {
  uni.showToast({
    title: '查看日记详情',
    icon: 'none'
  })
}

// 底部导航项
const tabbarItems = ref([
  { id: 'home', title: '首页', icon: 'i-carbon-home', path: '/pages/index/index' },
  { id: 'diary', title: '日记', icon: 'i-carbon-document', path: '/pages/diary/index' },
  { id: 'write', title: '写日记', icon: 'i-carbon-add', path: '/pages/diary/write' },
  { id: 'read', title: '阅读', icon: 'i-carbon-book', path: '/pages/diary/read', active: true }
])

const switchTab = (item) => {
  uni.navigateTo({
    url: item.path
  })
}
</script>

<template>
  <view class="read-container">
    <!-- 顶部区域 -->
    <view class="header">
      <text class="header-title">我的日记</text>
      <view class="header-actions">
        <view class="filter-btn">
          <view class="i-carbon-filter filter-icon"></view>
        </view>
      </view>
    </view>

    <!-- 日记列表 -->
    <view class="diary-list">
      <view 
        v-for="item in diaryList" 
        :key="item.id"
        class="diary-card"
        @click="viewDetail(item)"
      >
        <view class="card-header">
          <view class="date-info">
            <text class="mood-emoji">{{ item.mood }}</text>
            <view class="date-text">
              <text class="date">{{ item.date }}</text>
              <text class="weather">{{ item.weather }}</text>
            </view>
          </view>
        </view>
        <text class="card-title">{{ item.title }}</text>
        <text class="card-content">{{ item.content }}</text>
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
.read-container {
  min-height: 100vh;
  background: linear-gradient(135deg, 
    rgba(200, 185, 215, 0.9), 
    rgba(235, 210, 200, 0.9), 
    rgba(250, 238, 220, 0.9));
  padding-bottom: 80px;
  padding-top: env(safe-area-inset-top);
}

.header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 16px 20px;
  background-color: rgba(255, 255, 255, 0.8);
  backdrop-filter: blur(10px);
}

.header-title {
  font-size: 20px;
  font-weight: 700;
  color: rgba(45, 38, 55, 1);
}

.filter-btn {
  width: 40px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: rgba(52, 152, 219, 0.12);
  border-radius: 12px;
}

.filter-icon {
  font-size: 20px;
  color: rgba(52, 152, 219, 1);
}

.diary-list {
  padding: 16px 20px;
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.diary-card {
  background-color: rgba(255, 255, 255, 0.72);
  border-radius: 16px;
  padding: 16px;
  box-shadow: 0px 1px 4px rgba(100, 80, 120, 0.05), 0px 4px 24px rgba(100, 80, 120, 0.08);
  border: 1px solid rgba(255, 255, 255, 0.55);
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 12px;
}

.date-info {
  display: flex;
  align-items: center;
  gap: 12px;
}

.mood-emoji {
  font-size: 24px;
}

.date-text {
  display: flex;
  flex-direction: column;
}

.date {
  font-size: 14px;
  font-weight: 600;
  color: rgba(45, 38, 55, 1);
}

.weather {
  font-size: 12px;
  color: rgba(150, 138, 155, 1);
}

.card-title {
  font-size: 16px;
  font-weight: 700;
  color: rgba(45, 38, 55, 1);
  margin-bottom: 8px;
  display: block;
}

.card-content {
  font-size: 14px;
  line-height: 1.5;
  color: rgba(100, 88, 110, 1);
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
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
