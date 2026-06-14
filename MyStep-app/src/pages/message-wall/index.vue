<script lang="ts" setup>
import { ref, computed, onMounted, onUnmounted, nextTick } from 'vue'
import { getMsgList, addMsg, type IMsgWall } from '@/api/msgWall'

defineOptions({
  name: 'MessageWall',
})

definePage({
  type: 'page',
  style: {
    navigationStyle: 'custom',
    navigationBarTitleText: '留言墙',
  },
})

// 纸张颜色变体
const paperColors = [
  { name: '象牙白', color: '#FFFDF5' },
  { name: '米白', color: '#FFFAF0' },
  { name: '蛋壳色', color: '#FFF8E7' },
  { name: '浅奶色', color: '#FFF5E0' },
  { name: '旧纸色', color: '#FDF5E6' },
  { name: '茶渍色', color: '#FBF0D9' }
]

// 背景图列表
const backgrounds = [
  'linear-gradient(135deg, #f5f0e6 0%, #e8e0d0 100%)',
  'linear-gradient(135deg, #f0e8dc 0%, #e5d9c8 100%)',
  'linear-gradient(135deg, #f8f4ec 0%, #ebe3d5 100%)'
]

// 留言数据
const messages = ref<Array<{
  id: number
  nickname: string
  avatar: string
  content: string
  time: string
  position: { x: number; y: number }
  color: string
  rotation: number
  windOffset: { x: number; y: number; rotate: number }
  isPinned: boolean
}>>([])

// 加载状态
const loading = ref(false)
const submitting = ref(false)

// 风系统状态
const windState = ref({
  strength: 0,
  direction: 0,
  isBlowing: false
})

// 当前选中的纸张
const selectedPaper = ref<number | null>(null)
const pinnedPaper = ref<number | null>(null)

// 显示输入面板
const showInputPanel = ref(false)
const inputForm = ref({
  nickname: '',
  content: '',
  avatar: '/static/avatars/default1.png'
})

// 头像列表
const avatarList = ref([
  '/static/avatars/default1.png',
  '/static/avatars/default2.png',
  '/static/avatars/default3.png',
  '/static/avatars/default4.png',
  '/static/avatars/default5.png'
])

// 风系统定时器
let windTimer: number | null = null
let animationFrame: number | null = null

// 风的周期状态
const windCycle = ref({
  phase: 'calm' as 'calm' | 'light' | 'medium' | 'strong',
  duration: 0,
  maxDuration: 0
})

// 随机选择背景
const selectedBackground = ref(backgrounds[Math.floor(Math.random() * backgrounds.length)])

// 初始化风系统
const initWindSystem = () => {
  startBreathing()
  startWindCycle()
}

// 呼吸效果 - 微弱风
const startBreathing = () => {
  const animate = () => {
    messages.value.forEach((msg, index) => {
      if (pinnedPaper.value === index) return
      
      // 微弱的上下浮动和旋转
      const time = Date.now() / 1000
      const phase = index * 0.5 // 每张纸不同的相位
      const breathY = Math.sin(time * 0.8 + phase) * 2
      const breathRotate = Math.sin(time * 0.6 + phase) * 1
      
      msg.windOffset.y = breathY
      msg.windOffset.rotate = breathRotate
    })
    
    animationFrame = requestAnimationFrame(animate)
  }
  animate()
}

// 风周期循环
const startWindCycle = () => {
  const cyclePhases = () => {
    const rand = Math.random()
    
    if (rand < 0.6) {
      // 60% 平静期
      windCycle.value.phase = 'calm'
      windCycle.value.maxDuration = 8000 + Math.random() * 12000
    } else if (rand < 0.85) {
      // 25% 轻风
      windCycle.value.phase = 'light'
      windCycle.value.maxDuration = 4000 + Math.random() * 6000
      applyWind(0.3 + Math.random() * 0.2)
    } else if (rand < 0.95) {
      // 10% 中风
      windCycle.value.phase = 'medium'
      windCycle.value.maxDuration = 3000 + Math.random() * 5000
      applyWind(0.5 + Math.random() * 0.25)
    } else {
      // 5% 强风
      windCycle.value.phase = 'strong'
      windCycle.value.maxDuration = 2000 + Math.random() * 2000
      applyWind(0.75 + Math.random() * 0.25)
    }
    
    windCycle.value.duration = 0
  }
  
  windTimer = setInterval(() => {
    windCycle.value.duration += 100
    
    if (windCycle.value.duration >= windCycle.value.maxDuration) {
      // 重置风效果
      resetWindEffect()
      cyclePhases()
    }
  }, 100) as unknown as number
  
  cyclePhases()
}

// 应用风效果
const applyWind = (strength: number) => {
  const direction = Math.random() * 360
  
  windState.value.strength = strength
  windState.value.direction = direction
  windState.value.isBlowing = true
  
  // 根据风强度应用效果
  messages.value.forEach((msg, index) => {
    if (pinnedPaper.value === index) return
    
    setTimeout(() => {
      const windX = Math.cos(direction * Math.PI / 180) * strength * 20
      const windY = Math.sin(direction * Math.PI / 180) * strength * 10
      const windRotate = (Math.random() - 0.5) * strength * 15
      
      msg.windOffset.x = windX
      msg.windOffset.y += windY
      msg.windOffset.rotate += windRotate
    }, index * 150) // 级联延迟，形成波浪效果
  })
}

// 重置风效果
const resetWindEffect = () => {
  windState.value.isBlowing = false
  
  // 纸张回弹
  messages.value.forEach((msg, index) => {
    if (pinnedPaper.value === index) return
    
    setTimeout(() => {
      msg.windOffset.x = 0
    }, index * 100)
  })
}

// 点击纸张 - 置顶查看
const handlePaperTap = (index: number) => {
  if (pinnedPaper.value === index) {
    // 取消置顶
    pinnedPaper.value = null
    selectedPaper.value = null
  } else {
    // 置顶
    selectedPaper.value = index
    pinnedPaper.value = index
    messages.value[index].isPinned = true
    
    // 3秒后自动取消置顶
    setTimeout(() => {
      if (pinnedPaper.value === index) {
        pinnedPaper.value = null
        selectedPaper.value = null
        messages.value[index].isPinned = false
      }
    }, 3000)
  }
}

// 长按开始拖拽
const dragState = ref({
  isDragging: false,
  draggedIndex: -1,
  startX: 0,
  startY: 0,
  offsetX: 0,
  offsetY: 0
})

const handleLongPress = (index: number, event: TouchEvent) => {
  const touch = event.touches[0]
  
  dragState.value.isDragging = true
  dragState.value.draggedIndex = index
  dragState.value.startX = touch.clientX
  dragState.value.startY = touch.clientY
  
  pinnedPaper.value = index
  messages.value[index].isPinned = true
  
  // 触觉反馈
  uni.vibrateShort({ type: 'light' })
}

const handleTouchMove = (event: TouchEvent) => {
  if (!dragState.value.isDragging) return
  
  const touch = event.touches[0]
  const index = dragState.value.draggedIndex
  
  const deltaX = (touch.clientX - dragState.value.startX) / 10
  const deltaY = (touch.clientY - dragState.value.startY) / 10
  
  // 更新位置
  const newX = Math.max(5, Math.min(85, messages.value[index].position.x + deltaX))
  const newY = Math.max(5, Math.min(85, messages.value[index].position.y + deltaY))
  
  messages.value[index].position.x = newX
  messages.value[index].position.y = newY
  
  dragState.value.startX = touch.clientX
  dragState.value.startY = touch.clientY
}

const handleTouchEnd = () => {
  if (dragState.value.isDragging) {
    const index = dragState.value.draggedIndex
    messages.value[index].isPinned = false
    pinnedPaper.value = null
  }
  
  dragState.value.isDragging = false
  dragState.value.draggedIndex = -1
}

// 打开输入面板
const openInputPanel = () => {
  showInputPanel.value = true
}

// 关闭输入面板
const closeInputPanel = () => {
  showInputPanel.value = false
}

// 切换头像
const changeAvatar = () => {
  const currentIndex = avatarList.value.indexOf(inputForm.value.avatar)
  const nextIndex = (currentIndex + 1) % avatarList.value.length
  inputForm.value.avatar = avatarList.value[nextIndex]
}

// 格式化日期
const formatDisplayTime = (timeStr: string) => {
  // 处理时间格式 2026-05-15T14:30:00 或 2026-05-15 14:30:00
  if (timeStr.includes('T')) {
    return timeStr.replace('T', ' ').split('.')[0].substring(0, 16)
  }
  return timeStr.substring(0, 16)
}

// 获取留言列表
const fetchMessages = async () => {
  loading.value = true
  try {
    const result = await getMsgList()
    if (result && Array.isArray(result)) {
      messages.value = result.map((msg: IMsgWall, index: number) => {
        // 随机位置和旋转角度
        const randomLeft = Math.random() * 70 + 10
        const randomTop = Math.random() * 60 + 15
        const randomRotate = (Math.random() - 0.5) * 12
        const colorIndex = index % paperColors.length
        
        // 处理头像路径
        let avatarUrl = msg.head
        if (avatarUrl && !avatarUrl.startsWith('http') && !avatarUrl.startsWith('/static')) {
          // 如果是相对路径，添加API前缀
          avatarUrl = import.meta.env.VITE_SERVER_BASEURL + avatarUrl
        }
        
        return {
          id: msg.id || Date.now() + index,
          nickname: msg.leaveFrom,
          avatar: avatarUrl || '/static/avatars/default1.png',
          content: msg.leaveMsg,
          time: formatDisplayTime(msg.leaveTime),
          position: { x: randomLeft, y: randomTop },
          color: paperColors[colorIndex].color,
          rotation: randomRotate,
          windOffset: { x: 0, y: 0, rotate: 0 },
          isPinned: false
        }
      })
    }
  } catch (error) {
    console.error('获取留言失败:', error)
    uni.showToast({
      title: '获取留言失败',
      icon: 'none'
    })
  } finally {
    loading.value = false
  }
}

// 提交留言
const submitMessage = async () => {
  if (!inputForm.value.nickname.trim()) {
    uni.showToast({ title: '请输入网名', icon: 'none' })
    return
  }
  if (!inputForm.value.content.trim()) {
    uni.showToast({ title: '请输入留言内容', icon: 'none' })
    return
  }
  
  submitting.value = true
  
  try {
    // 创建FormData
    const formData = new FormData()
    formData.append('nickname', inputForm.value.nickname)
    formData.append('content', inputForm.value.content)
    
    // 将头像路径作为文件上传
    // 如果是本地默认头像，直接使用URL
    if (inputForm.value.avatar.startsWith('/static')) {
      // 使用默认头像URL
      const result = await addMsg(formData)
      
      if (result.code === 200) {
        // 添加新留言到列表
        const now = new Date()
        const time = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')} ${String(now.getHours()).padStart(2, '0')}:${String(now.getMinutes()).padStart(2, '0')}`
        
        const newMessage = {
          id: Date.now(),
          nickname: inputForm.value.nickname,
          avatar: inputForm.value.avatar,
          content: inputForm.value.content,
          time: time,
          position: {
            x: 20 + Math.random() * 60,
            y: 20 + Math.random() * 50
          },
          color: paperColors[Math.floor(Math.random() * paperColors.length)].color,
          rotation: (Math.random() - 0.5) * 10,
          windOffset: { x: 0, y: 0, rotate: 0 },
          isPinned: false
        }
        
        messages.value.unshift(newMessage)
        
        // 清空表单
        inputForm.value.nickname = ''
        inputForm.value.content = ''
        
        // 关闭面板
        showInputPanel.value = false
        
        uni.showToast({ title: '留言成功', icon: 'success' })
      } else {
        uni.showToast({ title: result.message || '留言失败', icon: 'none' })
      }
    } else {
      // 上传头像文件
      formData.append('avatar', inputForm.value.avatar)
      const result = await addMsg(formData)
      
      if (result.code === 200) {
        const now = new Date()
        const time = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')} ${String(now.getHours()).padStart(2, '0')}:${String(now.getMinutes()).padStart(2, '0')}`
        
        const newMessage = {
          id: Date.now(),
          nickname: inputForm.value.nickname,
          avatar: inputForm.value.avatar,
          content: inputForm.value.content,
          time: time,
          position: {
            x: 20 + Math.random() * 60,
            y: 20 + Math.random() * 50
          },
          color: paperColors[Math.floor(Math.random() * paperColors.length)].color,
          rotation: (Math.random() - 0.5) * 10,
          windOffset: { x: 0, y: 0, rotate: 0 },
          isPinned: false
        }
        
        messages.value.unshift(newMessage)
        
        inputForm.value.nickname = ''
        inputForm.value.content = ''
        showInputPanel.value = false
        
        uni.showToast({ title: '留言成功', icon: 'success' })
      } else {
        uni.showToast({ title: result.message || '留言失败', icon: 'none' })
      }
    }
  } catch (error) {
    console.error('提交留言失败:', error)
    uni.showToast({ title: '提交失败，请重试', icon: 'none' })
  } finally {
    submitting.value = false
  }
}

// 纸张样式
const getPaperStyle = (msg: typeof messages.value[0], index: number) => {
  const transform = `translate(${msg.windOffset.x}px, ${msg.windOffset.y}px) rotate(${msg.rotation + msg.windOffset.rotate}deg)`
  const scale = selectedPaper.value === index ? 1.08 : (dragState.value.draggedIndex === index ? 1.06 : 1)
  
  return {
    left: `${msg.position.x}%`,
    top: `${msg.position.y}%`,
    backgroundColor: msg.color,
    transform: `translate(-50%, -50%) ${transform} scale(${scale})`,
    zIndex: selectedPaper.value === index ? 1000 : index,
    opacity: 0.92,
    boxShadow: selectedPaper.value === index 
      ? '0 8px 32px rgba(80, 60, 30, 0.25)'
      : '1.5px 2px 10px rgba(80, 60, 30, 0.12)'
  }
}

onMounted(() => {
  // 锁定横屏
  // #ifdef APP-PLUS
  plus.screen.lockOrientation('landscape')
  // #endif
  
  // 获取留言数据
  fetchMessages()
  
  // 初始化风系统
  nextTick(() => {
    initWindSystem()
  })
})

onUnmounted(() => {
  // 解除横屏锁定
  // #ifdef APP-PLUS
  plus.screen.lockOrientation('portrait')
  // #endif
  
  // 清理定时器
  if (windTimer) {
    clearInterval(windTimer)
  }
  if (animationFrame) {
    cancelAnimationFrame(animationFrame)
  }
})
</script>

<template>
  <view class="message-wall-container" :style="{ background: selectedBackground }">
    <!-- 雾化柔光层 -->
    <view class="soft-light-layer"></view>
    
    <!-- 暗角装饰 -->
    <view class="vignette-layer"></view>
    
    <!-- 加载中状态 -->
    <view v-if="loading" class="loading-state">
      <view class="loading-paper">
        <view class="loading-text">加载中...</view>
      </view>
    </view>
    
    <!-- 留言纸张墙 -->
    <view v-else class="papers-wall">
      <view
        v-for="(msg, index) in messages"
        :key="msg.id"
        class="paper-note"
        :class="{ pinned: pinnedPaper === index, dragging: dragState.draggedIndex === index }"
        :style="getPaperStyle(msg, index)"
        @click="handlePaperTap(index)"
        @touchstart="handleLongPress(index, $event)"
        @touchmove="handleTouchMove($event)"
        @touchend="handleTouchEnd"
      >
        <!-- 田字格纹理 -->
        <view class="grid-pattern"></view>
        
        <!-- 内容区域 -->
        <view class="paper-content">
          <!-- 头像和网名 -->
          <view class="paper-header">
            <image class="paper-avatar" :src="msg.avatar" mode="aspectFill" />
            <text class="paper-nickname">{{ msg.nickname }}</text>
          </view>
          
          <!-- 留言内容 -->
          <view class="paper-body">
            <text class="paper-text">{{ msg.content }}</text>
          </view>
          
          <!-- 时间戳 -->
          <view class="paper-footer">
            <text class="paper-time">{{ msg.time }}</text>
          </view>
        </view>
      </view>
    </view>
    
    <!-- 空状态提示 -->
    <view v-if="!loading && messages.length === 0" class="empty-state">
      <view class="empty-paper">
        <text class="empty-text">写下第一行吧...</text>
      </view>
    </view>
    
    <!-- FAB按钮 -->
    <view class="fab-button" @click="openInputPanel">
      <view class="i-carbon-pen fab-icon"></view>
    </view>
    
    <!-- 输入面板 -->
    <view v-if="showInputPanel" class="input-panel-overlay" @click="closeInputPanel">
      <view class="input-panel" @click.stop>
        <view class="panel-header">
          <text class="panel-title">写留言</text>
          <view class="close-btn" @click="closeInputPanel">
            <view class="i-carbon-close"></view>
          </view>
        </view>
        
        <view class="panel-body">
          <!-- 头像选择 -->
          <view class="form-row avatar-row">
            <image class="avatar-preview" :src="inputForm.avatar" mode="aspectFill" @click="changeAvatar" />
            <text class="avatar-hint">点击更换头像</text>
          </view>
          
          <!-- 网名输入 -->
          <view class="form-row">
            <input 
              v-model="inputForm.nickname" 
              class="nickname-input"
              placeholder="请输入网名"
              maxlength="16"
            />
          </view>
          
          <!-- 留言输入 -->
          <view class="form-row">
            <textarea 
              v-model="inputForm.content"
              class="content-textarea"
              placeholder="写下你的留言..."
              maxlength="500"
            />
            <text class="char-count">{{ inputForm.content.length }}/500</text>
          </view>
          
          <!-- 提交按钮 -->
          <view class="form-row">
            <view class="submit-btn" :class="{ disabled: submitting }" @click="submitMessage">
              <text v-if="submitting">提交中...</text>
              <text v-else>发表留言</text>
            </view>
          </view>
        </view>
      </view>
    </view>
    
    <!-- 横屏提示 -->
    <view class="rotate-hint">
      <view class="i-carbon-phone rotate-icon"></view>
      <text class="rotate-text">请横屏查看</text>
    </view>
  </view>
</template>

<style scoped lang="scss">
.message-wall-container {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
}

// 雾化柔光层
.soft-light-layer {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(255, 252, 245, 0.55);
  backdrop-filter: blur(8px);
  pointer-events: none;
  z-index: 1;
}

// 暗角装饰
.vignette-layer {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: radial-gradient(ellipse at center, transparent 50%, rgba(0, 0, 0, 0.1) 100%);
  pointer-events: none;
  z-index: 2;
}

// 加载状态
.loading-state {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 5;
}

.loading-paper {
  width: 180px;
  height: 100px;
  background: #FFFDF5;
  border-radius: 4px;
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: 2px 2px 12px rgba(80, 60, 30, 0.15);
  animation: pulse 1.5s ease-in-out infinite;
}

.loading-text {
  font-size: 14px;
  color: #8B7355;
}

@keyframes pulse {
  0%, 100% { transform: scale(1); }
  50% { transform: scale(1.02); }
}

// 留言纸张墙
.papers-wall {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 10;
}

// 纸张样式
.paper-note {
  position: absolute;
  width: 180px;
  min-height: 130px;
  border-radius: 4px;
  cursor: grab;
  transition: transform 0.3s cubic-bezier(0.34, 1.56, 0.64, 1),
              box-shadow 0.3s ease;
  will-change: transform;
  
  &:active {
    cursor: grabbing;
  }
  
  &.pinned {
    z-index: 1000 !important;
  }
  
  &.dragging {
    box-shadow: 0 10px 30px rgba(80, 60, 30, 0.3) !important;
  }
}

// 田字格纹理
.grid-pattern {
  position: absolute;
  top: 8px;
  left: 8px;
  right: 8px;
  bottom: 8px;
  background-image: 
    linear-gradient(rgba(180, 190, 200, 0.18) 1px, transparent 1px),
    linear-gradient(90deg, rgba(180, 190, 200, 0.18) 1px, transparent 1px);
  background-size: 14px 14px;
  pointer-events: none;
  border-radius: 2px;
}

// 纸张内容
.paper-content {
  position: relative;
  padding: 12px 14px;
  z-index: 1;
}

.paper-header {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
  height: 28px;
}

.paper-avatar {
  width: 28px;
  height: 28px;
  border-radius: 4px;
  margin-right: 8px;
  object-fit: cover;
  background-color: #f0f0f0;
}

.paper-nickname {
  font-size: 14px;
  font-weight: 700;
  color: #4A3728;
}

.paper-body {
  margin-bottom: 8px;
  min-height: 40px;
}

.paper-text {
  font-size: 13px;
  line-height: 1.5;
  color: #4A3728;
  word-break: break-all;
}

.paper-footer {
  text-align: right;
}

.paper-time {
  font-size: 11px;
  color: #8B7355;
}

// 空状态
.empty-state {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 5;
}

.empty-paper {
  width: 220px;
  height: 150px;
  background: #FFFDF5;
  border-radius: 4px;
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: 2px 2px 12px rgba(80, 60, 30, 0.15);
  animation: float 4s ease-in-out infinite;
}

.empty-text {
  font-size: 16px;
  color: #8B7355;
  font-style: italic;
}

@keyframes float {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-10px); }
}

// FAB按钮
.fab-button {
  position: fixed;
  right: 20px;
  bottom: 20px;
  width: 56px;
  height: 56px;
  background: linear-gradient(135deg, #8B7355, #6B5344);
  border-radius: 16px;
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: 0 4px 16px rgba(107, 83, 68, 0.4);
  z-index: 100;
  transition: transform 0.2s ease;
  
  &:active {
    transform: scale(0.95);
  }
}

.fab-icon {
  font-size: 24px;
  color: #FFF;
}

// 输入面板遮罩
.input-panel-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.5);
  z-index: 200;
  display: flex;
  align-items: center;
  justify-content: center;
}

// 输入面板
.input-panel {
  width: 90%;
  max-width: 400px;
  background: rgba(255, 252, 245, 0.95);
  border-radius: 16px;
  overflow: hidden;
  backdrop-filter: blur(10px);
}

.panel-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 16px 20px;
  border-bottom: 1px solid rgba(139, 115, 85, 0.15);
}

.panel-title {
  font-size: 18px;
  font-weight: 700;
  color: #4A3728;
}

.close-btn {
  width: 32px;
  height: 32px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #8B7355;
  font-size: 20px;
}

.panel-body {
  padding: 20px;
}

.form-row {
  margin-bottom: 16px;
}

.avatar-row {
  display: flex;
  align-items: center;
  gap: 12px;
}

.avatar-preview {
  width: 50px;
  height: 50px;
  border-radius: 8px;
  border: 2px solid rgba(139, 115, 85, 0.3);
  background-color: #f0f0f0;
}

.avatar-hint {
  font-size: 12px;
  color: #8B7355;
}

.nickname-input {
  width: 100%;
  height: 44px;
  padding: 0 14px;
  background: rgba(255, 255, 255, 0.8);
  border: 1px solid rgba(139, 115, 85, 0.2);
  border-radius: 8px;
  font-size: 14px;
  color: #4A3728;
}

.content-textarea {
  width: 100%;
  min-height: 120px;
  padding: 12px 14px;
  background: rgba(255, 255, 255, 0.8);
  border: 1px solid rgba(139, 115, 85, 0.2);
  border-radius: 8px;
  font-size: 14px;
  color: #4A3728;
  line-height: 1.5;
}

.char-count {
  display: block;
  text-align: right;
  font-size: 12px;
  color: #8B7355;
  margin-top: 4px;
}

.submit-btn {
  width: 100%;
  height: 48px;
  background: linear-gradient(135deg, #8B7355, #6B5344);
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 16px;
  font-weight: 600;
  color: #FFF;
  
  &.disabled {
    opacity: 0.6;
  }
  
  &:active:not(.disabled) {
    opacity: 0.9;
  }
}

// 横屏提示
.rotate-hint {
  position: fixed;
  top: 10px;
  right: 10px;
  padding: 8px 12px;
  background: rgba(0, 0, 0, 0.5);
  border-radius: 8px;
  display: flex;
  align-items: center;
  gap: 6px;
  z-index: 50;
}

.rotate-icon {
  font-size: 16px;
  color: #FFF;
}

.rotate-text {
  font-size: 12px;
  color: #FFF;
}
</style>
