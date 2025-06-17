<template>
  <div class="message-board">
    <div class="message-section">
      <h2>此间有清音</h2>
      <div class="message-wall" :style="wallStyle">
      <div
        v-for="(message, index) in messages"
        :key="index"
        class="sticky-note"
        :style="message.position"
        draggable="true"
        @dragstart="dragStart($event, index)"
        @drag="drag($event, index)"
        @dragend="dragEnd($event, index)"
        @dragover.prevent
        @click="bringToFront(index)"
      >
        <div class="message-header">
          <img :src="message.avatar" class="message-avatar" alt="用户头像" />
          <span class="message-nickname">{{ message.nickname }}</span>
        </div>
        <div class="message-content">
          {{ message.content }}
        </div>
        <div class="message-time">
          {{ message.time }}
        </div>
      </div>
      </div>
      <div class="message-form">
        <div class="input-row">
        <div class="avatar-container">
          <img :src="head" class="selected-avatar" alt="选择的头像" @click="changeAvatar" />
        </div>
        <el-input
          v-model="leaveFrom"
          placeholder="请输入您的网名"
          class="nickname-input"
        ></el-input>
        <el-input
          v-model="leaveMsg"
          type="textarea"
          :rows="2"
          placeholder="请输入您的留言"
          class="message-input"
        ></el-input>
        <el-button type="primary" @click="submitMessage" class="submit-btn">
          发表留言
        </el-button>
        </div>
      </div>
    </div>
    <div class="content-section">
      <!-- 这里是后续内容区域 -->
    </div>
  </div>
</template>

<script>
import { addMsg, getMsg } from '@/apis/api/msgWall'
export default {
  name: 'messageBoard',
  data() {
    return {
      leaveMsg: '',
      leaveFrom: '',
      selectedImage: '',
      head: require('@/assets/icon/leave_wall.png'),
      avatarList: [],
      messages: [],
      maxZIndex: 100,
      draggedItem: null,
      initialOffset: { x: 0, y: 0 }
    }
  },
  created() {
    // 获取留言数据
    this.fetchMessages()

    // 导入背景图片
    const imageContext = require.context('../../assets/image', false, /\.(jpg|jpeg|png|gif)$/)
    const backgroundImages = imageContext.keys().map(key => imageContext(key))
    
    // 随机选择一张背景图片
    if (backgroundImages.length > 0) {
      const randomIndex = Math.floor(Math.random() * backgroundImages.length)
      this.selectedImage = backgroundImages[randomIndex]
    }

    // 导入头像图片
    const avatarContext = require.context('../../assets/icon', false, /\.png$/)
    this.avatarList = avatarContext.keys()
      .filter(key => key !== './leave_wall.png' && key !== './tool_box.png')
      .map(key => require(`@/assets/icon${key.slice(1)}`))
    
    // 随机选择一个头像
    if (this.avatarList.length > 0) {
      const randomAvatarIndex = Math.floor(Math.random() * this.avatarList.length)
      this.head = this.avatarList[randomAvatarIndex]
    }
  },
  computed: {
    wallStyle() {
      return {
        backgroundImage: this.selectedImage ? `url(${this.selectedImage})` : 'none'
      }
    }
  },
  methods: {
    changeAvatar() {
      if (this.avatarList.length > 0) {
        const currentIndex = this.avatarList.indexOf(this.head)
        const nextIndex = (currentIndex + 1) % this.avatarList.length
        this.head = this.avatarList[nextIndex]
      }
    },
    async submitMessage() {
      if (this.leaveMsg.trim() === '' || this.leaveFrom.trim() === '') {
        this.$message.warning('网名和留言内容不能为空')
        return
      }

      try {
        // 创建FormData对象
        const formData = new FormData()
        formData.append('nickname', this.leaveFrom)
        formData.append('content', this.leaveMsg)

        // 将头像URL转换为File对象并添加到FormData
        const response = await fetch(this.head)
        const blob = await response.blob()
        const avatarFile = new File([blob], 'avatar.png', { type: 'image/png' })
        formData.append('avatar', avatarFile)

        // 调用后端接口
        const result = await addMsg(formData)
        
        if (result.code === 200) {
          const now = new Date()
          const time = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')} ${String(now.getHours()).padStart(2, '0')}:${String(now.getMinutes()).padStart(2, '0')}:${String(now.getSeconds()).padStart(2, '0')}`
          
          // 随机位置和旋转角度
          const randomLeft = Math.random() * 80 + 10
          const randomTop = Math.random() * 80 + 10
          const randomRotate = Math.random() * 90 - 25
          result.data
          // 添加新留言到列表
          this.messages.unshift({
            content: this.leaveMsg,
            nickname: this.leaveFrom,
            avatar: this.head,
            time: time,
            position: {
              left: `${randomLeft}%`,
              top: `${randomTop}%`,
              transform: `rotate(${randomRotate}deg)`
            }
          })
          // 清空输入框
          this.leaveMsg = ''
          this.leaveFrom = ''
          this.$message.success(result.message)
        } else {
          this.$message.error(result.message || '留言失败')
        }
      } catch (error) {
        console.error('提交留言失败:', error)
        this.$message.error('提交留言失败，请稍后重试')
      }
    },
    dragStart(event, index) {
      this.draggedItem = this.messages[index]
      const rect = event.target.getBoundingClientRect()
      this.initialOffset = {
        x: event.clientX - rect.left,
        y: event.clientY - rect.top
      }
      event.dataTransfer.effectAllowed = 'move'
      event.dataTransfer.setDragImage(event.target, this.initialOffset.x, this.initialOffset.y)
      event.target.style.opacity = '0.6'
    },
    drag(event, index) {
      if (!this.draggedItem) return
      
      const x = event.clientX
      const y = event.clientY
      if (x === 0 && y === 0) return
      
      const wall = document.querySelector('.message-wall')
      const rect = wall.getBoundingClientRect()
      const note = event.target.getBoundingClientRect()
      
      // 计算新位置时考虑初始偏移量
      const left = Math.max(0, Math.min(((x - rect.left - this.initialOffset.x) / rect.width) * 100, 100 - (note.width / rect.width) * 100))
      const top = Math.max(0, Math.min(((y - rect.top - this.initialOffset.y) / rect.height) * 100, 100 - (note.height / rect.height) * 100))
      
      requestAnimationFrame(() => {
        this.messages[index].position.left = `${left}%`
        this.messages[index].position.top = `${top}%`
      })
    },
    dragEnd(event, index) {
      const wall = document.querySelector('.message-wall')
      const rect = wall.getBoundingClientRect()
      const note = event.target.getBoundingClientRect()

      const left = Math.max(0, Math.min(((event.clientX - rect.left - this.initialOffset.x) / rect.width) * 100, 100 - (note.width / rect.width) * 100))
      const top = Math.max(0, Math.min(((event.clientY - rect.top - this.initialOffset.y) / rect.height) * 100, 100 - (note.height / rect.height) * 100))

      this.messages[index].position.left = `${left}%`
      this.messages[index].position.top = `${top}%`
      this.bringToFront(index)

      this.draggedItem = null
      event.target.style.opacity = '1'
    },
    bringToFront(index) {
      this.maxZIndex++
      this.messages[index].position.zIndex = this.maxZIndex
    },
    async fetchMessages() {
      try {
        const result = await getMsg()
        if (result.code === 200 && result.data) {
          // 清空默认的欢迎消息
          this.messages = []
          // 处理每条留言数据
          console.log(result.data) 
          result.data.forEach(msg => {
            // 随机位置和旋转角度
            const randomLeft = Math.random() * 80 + 10
            const randomTop = Math.random() * 80 + 10
            const randomRotate = Math.random() * 90 - 45
            // 如果头像为空，从avatarList中随机选择一个头像
            const avatarToUse = '/api'+msg.head
            
            this.messages.push({
              content: msg.leaveMsg,
              nickname: msg.leaveFrom,
              avatar: avatarToUse,
              time: msg.leaveTime.split('.')[0],
              position: {
                left: `${randomLeft}%`,
                top: `${randomTop}%`,
                transform: `rotate(${randomRotate}deg)`,
                zIndex: Math.floor(Math.random() * this.maxZIndex)
              }
            })
          })
        } else {
          this.$message.error(result.message || '获取留言失败')
        }
      } catch (error) {
        console.error('获取留言失败:', error)
        this.$message.error('获取留言失败，请稍后重试')
      }
    }
  }
}
</script>

<style lang="less" scoped>
.message-board {
  max-width: 100%;
  margin: 0 auto;
  padding: 0;
  margin-top: -20px;

  .message-section {
    background: rgba(255, 255, 255, 0.9);
    border-radius: 12px;
    padding: 2px 20px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    margin-bottom: 10px;

    h2 {
      text-align: center;
      margin: 0 0 15px;
      color: #409EFF;
    }
  }

  .content-section {
    background: rgba(255, 255, 255, 0.9);
    border-radius: 12px;
    padding: 20px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    min-height: 200px;
  }

  @media (max-width: 768px) {
    padding: 10px;
  }
}

.message-form {
  margin: 30px 0;
  
  .input-row {
    display: flex;
    align-items: center;
    gap: 10px;
    
    .avatar-container {
      text-align: center;
      
      .selected-avatar {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        object-fit: cover;
        cursor: pointer;
        transition: transform 0.3s ease, box-shadow 0.3s ease;

        &:hover {
          transform: scale(1.05);
          box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
      }
      
      .change-avatar-btn {
        padding: 0;
        font-size: 12px;
      }
    }
    
    .nickname-input {
      width: 150px;
      
      /deep/ .el-input__inner:focus {
        border-color: #ffa500;
      }
    }
    
    .message-input {
      flex: 1;
      margin: 0;
      
      /deep/ .el-textarea__inner {
        margin: 0;
        padding: 6px 15px;
      }
      
      /deep/ .el-textarea__inner:focus {
        border-color: #ffa500;
      }
    }
    
    .submit-btn {
      align-self: center;
    }
  }
}

.message-wall {
  position: relative;
  height: 650px;
  background-size: cover;
  background-position: center;
  border-radius: 8px;
  padding: 20px;
  overflow: hidden;

  &::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: inherit;
    background-size: cover;
    background-position: center;
    filter: blur(3px);
    opacity: 1;
    z-index: 0;
    backdrop-filter: blur(10px);
    background-color: rgba(255, 255, 255, 0.5);
  }
}

.sticky-note {
  position: absolute;
  z-index: 2;
  width: 200px;
  min-height: 150px;
  padding: 15px;
  background: var(--note-color, rgba(255, 247, 186, 0.75));
  border-radius: 12px;
  box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.15),
              inset 0 -20px 20px rgba(255, 255, 255, 0.2),
              0 0 15px rgba(255, 255, 255, 0.3);
  backdrop-filter: blur(0px);
  border: 1px solid rgba(255, 255, 255, 0.3);
  cursor: grab;
  transition: all 0.3s ease;
  user-select: none;
  will-change: transform;
  transform-style: preserve-3d;
  perspective: 1000px;

  .message-header {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
    
    .message-avatar {
      width: 30px;
      height: 30px;
      border-radius: 50%;
      margin-right: 8px;
      object-fit: cover;
    }
    
    .message-nickname {
      font-weight: bold;
      color: #333;
    }
  }

  &::before {
    content: '';
    position: absolute;
    top: -15px;
    left: 50%;
    transform: translateX(-50%) rotate(-2deg);
    width: 100px;
    height: 30px;
    background: rgba(255, 255, 255,1);
    border-radius: 3px;
    box-shadow: 0 0 3px rgba(0, 0, 0, 0.1);
    opacity: 0.8;
    background-image: linear-gradient(45deg, 
      rgba(0,0,0,0.05) 25%, 
      transparent 25%, 
      transparent 50%, 
      rgba(0,0,0,0.05) 50%, 
      rgba(0,0,0,0.05) 75%, 
      transparent 75%, 
      transparent
    );
    background-size: 10px 10px;
    z-index: 2;
  }

  &:nth-child(6n+1) { --note-color: rgba(255, 182, 193, 0.75); } /* 浅粉色 */
  &:nth-child(6n+2) { --note-color: rgba(255, 166, 77, 0.75); } /* 深橙色 */
  &:nth-child(6n+3) { --note-color: rgba(100, 149, 237, 0.75); } /* 深蓝色 */
  &:nth-child(6n+4) { --note-color: rgba(72, 209, 204, 0.75); } /* 青色 */
  &:nth-child(6n+5) { --note-color: rgba(144, 238, 144, 0.75); } /* 草绿色 */
  &:nth-child(6n) { --note-color: rgba(221, 160, 221, 0.75); } /* 淡紫色 */
  

  &::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(135deg, rgba(255, 255, 255, 0.4) 0%, rgba(255, 255, 255, 0) 50%);
    border-radius: inherit;
    pointer-events: none;
  }

  &:hover {
    transform: scale(1.02) rotateX(5deg) !important;
    box-shadow: 3px 3px 15px rgba(0, 0, 0, 0.2),
                inset 0 -20px 20px rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(3px);
  }

  &:active {
    cursor: grabbing;
  }

  .message-content {
    font-size: 16px;
    margin-bottom: 15px;
    word-break: break-all;
  }

  .message-time {
    font-size: 12px;
    color: #666;
    text-align: right;
  }
}
</style>
