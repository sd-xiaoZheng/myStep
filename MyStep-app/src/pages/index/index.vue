<script lang="ts" setup>
import { ref } from 'vue'

defineOptions({
  name: 'Home',
})
definePage({
  // 使用 type: "home" 属性设置首页，其他页面不需要设置，默认为page
  type: 'home',
  style: {
    // 'custom' 表示开启自定义导航栏，默认 'default'
    navigationStyle: 'custom',
    navigationBarTitleText: '首页',
  },
})

// 获取当前日期
const getCurrentDate = () => {
  const now = new Date()
  const year = now.getFullYear()
  const month = now.getMonth() + 1
  const day = now.getDate()
  return `${year}年${month}月${day}日`
}

const currentDate = ref(getCurrentDate())

// 定义方块选项 - 按照设计方案配置
const menuItems = ref([
  {
    id: 1,
    title: '日记',
    subtitle: '记录日常点滴',
    icon: 'i-carbon-document',
    path: '/pages/diary/index',
    bgColor: 'linear-gradient(135deg, rgba(52, 152, 219, 0.8), rgba(135, 206, 235, 0.8))',
    highlightColor: '#3498db'
  },
  {
    id: 2,
    title: '留言墙',
    subtitle: '留下暖心话语',
    icon: 'i-carbon-chat',
    path: '/pages/message-wall/index',
    bgColor: 'linear-gradient(135deg, rgba(142, 68, 173, 0.8), rgba(195, 155, 211, 0.8))',
    highlightColor: '#8e44ad'
  },
  {
    id: 3,
    title: '照片',
    subtitle: '定格美好瞬间',
    icon: 'i-carbon-image',
    path: '/pages/photo/index',
    bgColor: 'linear-gradient(135deg, rgba(243, 229, 245, 0.8), rgba(225, 190, 231, 0.8))',
    highlightColor: '#e1bee7'
  },
  {
    id: 4,
    title: '玩具',
    subtitle: '珍藏童年回忆',
    icon: 'i-carbon-game',
    path: '/pages/toy/index',
    bgColor: 'linear-gradient(135deg, rgba(255, 243, 224, 0.8), rgba(255, 224, 178, 0.8))',
    highlightColor: '#ffe0b2'
  }
])

console.log('index/index 首页打印了')

onLoad(() => {
  console.log('测试 uni API 自动引入: onLoad')
})

// 处理方块点击事件
const handleItemClick = (item) => {
  console.log('点击了:', item.title)
  
  // 添加点击反馈动画
  uni.vibrateShort({
    type: 'light'
  })
  
  // 路由跳转
  if (item.path) {
    uni.navigateTo({
      url: item.path,
      fail: () => {
        uni.showToast({
          title: `即将跳转到${item.title}`,
          icon: 'none'
        })
      }
    })
  }
}

// 触摸开始
const onTouchStart = (event) => {
  event.currentTarget.style.transform = 'scale(0.98)'
}

// 触摸结束
const onTouchEnd = (event) => {
  event.currentTarget.style.transform = 'scale(1)'
}
</script>

<template>
  <view class="home-container">
    <!-- 顶部欢迎区 -->
    <view class="welcome-section">
      <view class="greeting-wrapper">
        <text class="greeting-text">&gt; 我的成长足迹 &lt;</text>
        <text class="date-text">今天是 {{ currentDate }}</text>
      </view>
    </view>

    <!-- 核心功能方块区 -->
    <view class="menu-section">
      <view class="menu-grid">
        <view 
          v-for="(item, index) in menuItems" 
          :key="item.id"
          class="menu-item"
          :style="{ background: item.bgColor }"
          @click="handleItemClick(item)"
          @touchstart="onTouchStart($event)"
          @touchend="onTouchEnd($event)"
        >
          <!-- 图标 -->
          <view class="icon-wrapper">
            <view :class="[item.icon, 'menu-icon']"></view>
          </view>
          <!-- 标题 -->
          <text class="menu-title">{{ item.title }}</text>
          <!-- 副标题 -->
          <text class="menu-subtitle">{{ item.subtitle }}</text>
        </view>
      </view>
    </view>

    <!-- 底部留白区 -->
    <view class="bottom-spacer"></view>
  </view>
</template>

<style scoped lang="scss">
.home-container {
  min-height: 100vh;
  background: linear-gradient(135deg, 
    rgba(180, 170, 190, 0.85), 
    rgba(220, 200, 190, 0.85), 
    rgba(245, 235, 220, 0.85));
  display: flex;
  flex-direction: column;
  padding-top: env(safe-area-inset-top);
  padding-bottom: env(safe-area-inset-bottom);
}

/* 顶部欢迎区 */
.welcome-section {
  flex: 0 0 15%;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px;
  backdrop-filter: blur(8px);
}

.greeting-wrapper {
  text-align: center;
}

.greeting-text {
  display: block;
  font-size: 20px;
  font-weight: bold;
  color: #333;
  margin-bottom: 8px;
  font-family: 'PingFang SC', 'Microsoft YaHei', sans-serif;
}

.date-text {
  display: block;
  font-size: 13px;
  color: #999;
  font-family: 'PingFang SC', 'Microsoft YaHei', sans-serif;
}

/* 核心功能方块区 */
.menu-section {
  flex: 0 0 70%;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0 16px;
}

.menu-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 16px;
  width: 100%;
  max-width: 343px; /* 375px - 32px padding */
}

.menu-item {
  aspect-ratio: 1;
  border-radius: 16px;
  backdrop-filter: blur(8px);
  border: 1px solid rgba(255, 255, 255, 0.3);
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 16px;
  transition: all 0.3s ease;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  position: relative;
  overflow: hidden;
  
  /* 纸张纹理效果 */
  &::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.8' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100' height='100' filter='url(%23noise)' opacity='0.08'/%3E%3C/svg%3E");
    opacity: 0.3;
    pointer-events: none;
  }
  
  &:active {
    transform: scale(0.98);
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.12);
  }
}

.icon-wrapper {
  width: 60px;
  height: 60px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 12px;
  z-index: 1;
}

.menu-icon {
  font-size: 40px;
  color: #333;
}

.menu-title {
  font-size: 18px;
  font-weight: bold;
  color: #333;
  margin-bottom: 4px;
  z-index: 1;
  font-family: 'PingFang SC', 'Microsoft YaHei', sans-serif;
}

.menu-subtitle {
  font-size: 12px;
  color: #666;
  z-index: 1;
  font-family: 'PingFang SC', 'Microsoft YaHei', sans-serif;
}

/* 底部留白区 */
.bottom-spacer {
  flex: 0 0 15%;
  min-height: 34px; /* Home Indicator 安全区 */
}

/* 错峰淡入动画 */
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.menu-item {
  animation: fadeInUp 0.5s ease-out forwards;
  opacity: 0;
  
  &:nth-child(1) { animation-delay: 0.1s; }
  &:nth-child(2) { animation-delay: 0.2s; }
  &:nth-child(3) { animation-delay: 0.3s; }
  &:nth-child(4) { animation-delay: 0.4s; }
}
</style>
