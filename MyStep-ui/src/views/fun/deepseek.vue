<template>
  <div class="chat-container">
    <div class="chat-messages" ref="messagesContainer">
      <!-- 用户消息和机器人消息 -->
      <div
          v-for="(message, index) in messages"
          :key="index"
          class="message"
          :class="messageClass(message.role)"
      >
        {{ message.content }}
      </div>

      <!-- 加载状态 -->
      <div v-if="isLoading" class="loading">
        <span class="dot-flashing"></span>
      </div>
    </div>

    <!-- 输入区域 -->
    <div class="input-group">
      <textarea
          v-model="inputMessage"
          @keydown.enter.exact.prevent="sendMessage"
          placeholder="输入消息..."
          :disabled="isLoading"
          rows="1"
          @input="autoResize"
      ></textarea>
      <button
          @click="sendMessage"
          :disabled="!canSend"
          :class="{ 'loading-btn': isLoading }"
      >
        <span v-if="!isLoading">发送</span>
        <div v-else class="loader"></div>
      </button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      messages: [
        {role: 'bot', content: '你好！我是智能助手，有什么可以帮您？'}
      ],
      inputMessage: '',
      isLoading: false
    }
  },
  computed: {
    canSend() {
      return this.inputMessage.trim() && !this.isLoading
    }
  },
  methods: {
    messageClass(role) {
      return {
        'user-message': role === 'user',
        'bot-message': role === 'bot'
      }
    },

    autoResize(e) {
      e.target.style.height = 'auto'
      e.target.style.height = e.target.scrollHeight + 'px'
    },

    async sendMessage() {
      try {
        // 添加用户消息
        this.messages.push({
          role: 'user',
          content: this.inputMessage.trim()
        })

        const userMessage = this.inputMessage
        this.inputMessage = ''
        this.isLoading = true

        // 模拟 API 调用 - 替换实际 API 调用
        const botResponse = await this.mockApiCall(userMessage)
        this.messages.push({
          role: 'bot',
          content: botResponse
        })
      } catch (error) {
        this.showError(error.message)
      } finally {
        this.isLoading = false
        this.$nextTick(() => {
          this.$refs.messagesContainer.scrollTop =
              this.$refs.messagesContainer.scrollHeight
        })
      }
    },

    mockApiCall(query) {
      return new Promise((resolve) => {
        setTimeout(() => {
          resolve(`已收到：${query}（这是模拟响应）`)
        }, 1500)
      })
    },

    showError(msg) {
      this.messages.push({
        role: 'bot',
        content: `❌ 错误：${msg}`
      })
    }
  }
}
</script>

<style scoped>
.chat-container {
  width: 100%;
  max-width: 800px;
  margin: 0 auto;
  height: 90vh;
  display: flex;
  flex-direction: column;
  background: #ffffff;
  border-radius: 16px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.chat-messages {
  flex: 1;
  overflow-y: auto;
  padding: 20px;
  background: #f9fafb;
}

.message {
  max-width: 70%;
  margin: 12px 0;
  padding: 12px 18px;
  border-radius: 12px;
  line-height: 1.5;
  word-break: break-word;
  animation: fadeIn 0.3s ease-in;
}

.user-message {
  background: #3b82f6;
  color: white;
  margin-left: auto;
}

.bot-message {
  background: #e5e7eb;
  color: #111827;
  margin-right: auto;
}

.input-group {
  padding: 20px;
  border-top: 1px solid #e5e7eb;
  display: flex;
  gap: 12px;
  background: white;
}

textarea {
  flex: 1;
  padding: 12px 16px;
  border: 1px solid #e5e7eb;
  border-radius: 8px;
  resize: none;
  max-height: 200px;
  font-family: inherit;
}

button {
  padding: 0 24px;
  background: #3b82f6;
  color: white;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  transition: all 0.2s;
}

button:disabled {
  background: #9ca3af;
  cursor: not-allowed;
}

.loading {
  padding: 16px;
  text-align: center;
  color: #6b7280;
}

/* 加载动画 */
.dot-flashing {
  position: relative;
  width: 8px;
  height: 8px;
  border-radius: 5px;
  background-color: #9ca3af;
  animation: dotFlashing 1s infinite linear;
}

.dot-flashing::before,
.dot-flashing::after {
  content: '';
  display: inline-block;
  position: absolute;
  top: 0;
}

.dot-flashing::before {
  left: -12px;
  width: 8px;
  height: 8px;
  border-radius: 5px;
  background-color: #9ca3af;
  animation: dotFlashing 1s infinite linear;
  animation-delay: 0s;
}

.dot-flashing::after {
  left: 12px;
  width: 8px;
  height: 8px;
  border-radius: 5px;
  background-color: #9ca3af;
  animation: dotFlashing 1s infinite linear;
  animation-delay: 0.2s;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes dotFlashing {
  0% {
    background-color: #9ca3af;
  }
  50%, 100% {
    background-color: #e5e7eb;
  }
}

.loader {
  width: 18px;
  height: 18px;
  border: 2px solid #fff;
  border-bottom-color: transparent;
  border-radius: 50%;
  animation: rotation 1s linear infinite;
}

@keyframes rotation {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
</style>