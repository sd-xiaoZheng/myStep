<script lang="ts" setup>
import { ref } from 'vue'
import { useUserStore } from '@/store/user'
import { addTodo } from '@/api/article'

defineOptions({
  name: 'TodoWrite',
})

definePage({
  type: 'page',
  style: {
    navigationStyle: 'custom',
    navigationBarTitleText: '新建代办',
  },
})

const userStore = useUserStore()

// 代办内容
const todoContent = ref('')
// 写作时间
const writeDate = ref(getTodayStr())
const writeTime = ref(getNowTimeStr())
// 是否星标（重要代办）
const isStar = ref(false)

/** 获取今天日期字符串 yyyy-MM-dd */
function getTodayStr(): string {
  const now = new Date()
  const y = now.getFullYear()
  const m = String(now.getMonth() + 1).padStart(2, '0')
  const d = String(now.getDate()).padStart(2, '0')
  return `${y}-${m}-${d}`
}

/** 获取当前时间字符串 HH:mm */
function getNowTimeStr(): string {
  const now = new Date()
  const h = String(now.getHours()).padStart(2, '0')
  const min = String(now.getMinutes()).padStart(2, '0')
  return `${h}:${min}`
}

/** 拼接完整的写作时间 */
function getFullWriteTime(): string {
  return `${writeDate.value} ${writeTime.value}:00`
}

/** 切换星标 */
const toggleStar = () => {
  isStar.value = !isStar.value
}

/** 选择日期 */
const onDateChange = (e: any) => {
  writeDate.value = e.detail.value
}

/** 选择时间 */
const onTimeChange = (e: any) => {
  writeTime.value = e.detail.value
}

/** 保存代办 */
const saveTodo = async () => {
  if (!todoContent.value.trim()) {
    uni.showToast({ title: '请输入代办内容', icon: 'none' })
    return
  }

  const userInfo = userStore.userInfo
  if (!userInfo.userId || userInfo.userId === -1) {
    uni.showToast({ title: '请先登录', icon: 'none' })
    return
  }

  try {
    await addTodo({
      content: todoContent.value,
      writeTime: getFullWriteTime(),
      authorName: userInfo.nickname || userInfo.username,
      authorId: userInfo.userId,
      isStar: isStar.value,
    })
    uni.showToast({ title: '保存成功', icon: 'success' })
    setTimeout(() => {
      uni.navigateBack()
    }, 1500)
  } catch (e) {
    console.error('保存代办失败:', e)
  }
}

// 底部导航项
const tabbarItems = ref([
  { id: 'home', title: '首页', icon: 'i-carbon-home', path: '/pages/index/index' },
  { id: 'diary', title: '日记', icon: 'i-carbon-document', path: '/pages/diary/index' },
  { id: 'todo', title: '代办', icon: 'i-carbon-task', path: '/pages/diary/todoWrite', active: true },
  { id: 'read', title: '阅读', icon: 'i-carbon-book', path: '/pages/diary/read' },
])

const switchTab = (item: any) => {
  if (item.id === 'home') {
    uni.switchTab({ url: item.path })
  } else {
    uni.navigateTo({ url: item.path })
  }
}
</script>

<template>
  <view class="todo-write-container">
    <!-- 顶部区域 -->
    <view class="header">
      <view class="back-btn" @click="uni.navigateBack()">
        <view class="i-carbon-arrow-left back-icon"></view>
      </view>
      <text class="header-title">新建代办</text>
      <view class="save-btn" @click="saveTodo">保存</view>
    </view>

    <!-- 表单内容区 -->
    <view class="form-section">
      <!-- 代办内容 -->
      <view class="form-group">
        <text class="form-label">代办内容</text>
        <textarea
          v-model="todoContent"
          class="content-textarea"
          placeholder="写下要做的事情..."
          maxlength="2000"
        />
        <text class="char-count">{{ todoContent.length }}/2000</text>
      </view>

      <!-- 写作时间 -->
      <view class="form-group">
        <text class="form-label">写作时间</text>
        <view class="time-picker-row">
          <picker mode="date" :value="writeDate" @change="onDateChange" class="date-picker">
            <view class="picker-value">{{ writeDate }}</view>
          </picker>
          <picker mode="time" :value="writeTime" @change="onTimeChange" class="time-picker">
            <view class="picker-value">{{ writeTime }}</view>
          </picker>
        </view>
      </view>

      <!-- 写作者 -->
      <view class="form-group">
        <text class="form-label">写作者</text>
        <view class="author-display">
          <text class="author-name">{{ userStore.userInfo.nickname || userStore.userInfo.username || '未登录' }}</text>
        </view>
      </view>

      <!-- 是否星标 -->
      <view class="form-group">
        <view class="star-row" @click="toggleStar">
          <text class="form-label">重要代办</text>
          <view class="star-toggle" :class="{ active: isStar }">
            <view v-if="isStar" class="i-carbon-star-filled star-icon-filled"></view>
            <view v-else class="i-carbon-star star-icon"></view>
          </view>
        </view>
        <text class="form-hint">星标后的代办会在列表中优先显示</text>
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
.todo-write-container {
  min-height: 100vh;
  background: linear-gradient(135deg,
    rgba(200, 185, 215, 0.9),
    rgba(235, 210, 200, 0.9),
    rgba(250, 238, 220, 0.9));
  padding-bottom: 80px;
  padding-top: env(safe-area-inset-top);
}

/* 顶部导航 */
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

/* 表单区 */
.form-section {
  padding: 20px;
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.form-group {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.form-label {
  font-size: 16px;
  font-weight: 700;
  color: rgba(45, 38, 55, 1);
}

.form-hint {
  font-size: 12px;
  color: rgba(150, 138, 155, 1);
}

/* 内容输入 */
.content-textarea {
  width: 100%;
  min-height: 200px;
  padding: 16px;
  background-color: rgba(255, 255, 255, 0.7);
  border-radius: 16px;
  font-size: 16px;
  line-height: 1.6;
  color: rgba(45, 38, 55, 1);
}

.char-count {
  align-self: flex-end;
  font-size: 12px;
  color: rgba(150, 138, 155, 1);
  margin-top: -4px;
  margin-right: 12px;
}

/* 时间选择 */
.time-picker-row {
  display: flex;
  gap: 16px;
}

.date-picker {
  flex: 1;
}

.time-picker {
  width: 120px;
}

.picker-value {
  padding: 12px 16px;
  background-color: rgba(255, 255, 255, 0.7);
  border-radius: 12px;
  font-size: 15px;
  color: rgba(45, 38, 55, 1);
  text-align: center;
}

/* 写作者展示 */
.author-display {
  padding: 12px 16px;
  background-color: rgba(255, 255, 255, 0.5);
  border-radius: 12px;
}

.author-name {
  font-size: 15px;
  color: rgba(45, 38, 55, 1);
}

/* 星标切换 */
.star-row {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.star-toggle {
  width: 44px;
  height: 44px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 12px;
  background-color: rgba(255, 255, 255, 0.7);
  transition: all 0.2s;

  &.active {
    background-color: rgba(241, 196, 15, 0.15);
  }
}

.star-icon,
.star-icon-filled {
  font-size: 24px;
  color: rgba(150, 138, 155, 1);
}

.star-icon-filled {
  color: rgba(241, 196, 15, 1);
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
