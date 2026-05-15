<script lang="ts" setup>
import { ref } from 'vue'

defineOptions({
  name: 'DiaryWrite',
})

definePage({
  type: 'page',
  style: {
    navigationStyle: 'custom',
    navigationBarTitleText: '写日记',
  },
})

const diaryContent = ref('')
const selectedMood = ref('')

const moods = [
  { id: 'happy', emoji: '😊', label: '开心' },
  { id: 'calm', emoji: '😌', label: '平静' },
  { id: 'sad', emoji: '😢', label: '难过' },
  { id: 'angry', emoji: '😠', label: '生气' },
  { id: 'tired', emoji: '😴', label: '疲惫' }
]

const selectMood = (mood) => {
  selectedMood.value = mood.id
}

const saveDiary = () => {
  if (!diaryContent.value.trim()) {
    uni.showToast({
      title: '请输入日记内容',
      icon: 'none'
    })
    return
  }
  uni.showToast({
    title: '保存成功',
    icon: 'success'
  })
  setTimeout(() => {
    uni.navigateBack()
  }, 1500)
}

// 底部导航项
const tabbarItems = ref([
  { id: 'home', title: '首页', icon: 'i-carbon-home', path: '/pages/index/index' },
  { id: 'diary', title: '日记', icon: 'i-carbon-document', path: '/pages/diary/index' },
  { id: 'write', title: '写日记', icon: 'i-carbon-add', path: '/pages/diary/write', active: true },
  { id: 'read', title: '阅读', icon: 'i-carbon-book', path: '/pages/diary/read' }
])

const switchTab = (item) => {
  uni.navigateTo({
    url: item.path
  })
}
</script>

<template>
  <view class="write-container">
    <!-- 顶部区域 -->
    <view class="header">
      <view class="back-btn" @click="uni.navigateBack()">
        <view class="i-carbon-arrow-left back-icon"></view>
      </view>
      <text class="header-title">写日记</text>
      <view class="save-btn" @click="saveDiary">保存</view>
    </view>

    <!-- 心情选择 -->
    <view class="mood-section">
      <text class="section-title">今天的心情</text>
      <view class="mood-list">
        <view 
          v-for="mood in moods" 
          :key="mood.id"
          class="mood-item"
          :class="{ selected: selectedMood === mood.id }"
          @click="selectMood(mood)"
        >
          <text class="mood-emoji">{{ mood.emoji }}</text>
          <text class="mood-label">{{ mood.label }}</text>
        </view>
      </view>
    </view>

    <!-- 日记内容 -->
    <view class="content-section">
      <textarea 
        v-model="diaryContent"
        class="diary-textarea"
        placeholder="写下今天的故事..."
        maxlength="2000"
      />
      <text class="char-count">{{ diaryContent.length }}/2000</text>
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
.write-container {
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

.back-btn {
  width: 40px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.back-icon {
  font-size: 24px;
  color: rgba(45, 38, 55, 1);
}

.header-title {
  font-size: 18px;
  font-weight: 700;
  color: rgba(45, 38, 55, 1);
}

.save-btn {
  padding: 8px 16px;
  background: linear-gradient(135deg, rgba(52, 152, 219, 1), rgba(41, 128, 185, 1));
  border-radius: 20px;
  font-size: 14px;
  color: #fff;
}

.mood-section {
  padding: 20px;
}

.section-title {
  font-size: 16px;
  font-weight: 700;
  color: rgba(45, 38, 55, 1);
  margin-bottom: 16px;
  display: block;
}

.mood-list {
  display: flex;
  gap: 12px;
}

.mood-item {
  flex: 1;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 8px;
  padding: 12px;
  background-color: rgba(255, 255, 255, 0.7);
  border-radius: 12px;
  border: 2px solid transparent;
  
  &.selected {
    border-color: rgba(52, 152, 219, 1);
    background-color: rgba(52, 152, 219, 0.1);
  }
}

.mood-emoji {
  font-size: 28px;
}

.mood-label {
  font-size: 12px;
  color: rgba(100, 88, 110, 1);
}

.content-section {
  padding: 0 20px;
  position: relative;
}

.diary-textarea {
  width: 100%;
  min-height: 300px;
  padding: 16px;
  background-color: rgba(255, 255, 255, 0.7);
  border-radius: 16px;
  font-size: 16px;
  line-height: 1.6;
  color: rgba(45, 38, 55, 1);
}

.char-count {
  position: absolute;
  right: 36px;
  bottom: 16px;
  font-size: 12px;
  color: rgba(150, 138, 155, 1);
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
