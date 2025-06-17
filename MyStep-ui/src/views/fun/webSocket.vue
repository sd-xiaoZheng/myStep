<template>
  <div>
<!--    WebSocket！-->
    <div style="margin: auto;width: 98px">
      <span style="font-weight: 800">WebSocket！</span>
    </div>
    <div style="margin: auto;width: 220px">
      <el-row>
        <el-button type="success" plain @click="openWebSocket">手动连接</el-button>
        <el-button type="danger" plain @click="clossWebSocket">手动关闭</el-button>
<!--        <el-button type="primary" plain @click="senMessage">发送消息</el-button>-->
        <!--      <el-button type="info" plain>信息按钮</el-button>-->
        <!--      <el-button type="warning" plain>警告按钮</el-button>-->
        <!--      <el-button type="danger" plain>危险按钮</el-button>-->
      </el-row>
    </div>
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
  </div>
</template>

<script>
export default {
  name: "webSocket",
  data() {
    return {
      // 版本号
      version: "3.6.4",
      //websocket重连定时器
      timer: null,
      //websocket
      ws: null,
      //是否手动关闭websocket
      isHandle:false,

      //对话框
      messages: [
        // {role: 'bot', content: '你好！我是智能助手，有什么可以帮您？'}
      ],
      inputMessage: '',
      isLoading: false,
    };
  },
  computed: {
    canSend() {
      return this.inputMessage.trim() && !this.isLoading
    }
  },
  mounted() {
    if (typeof (WebSocket) == "undefined") {
      let temp={role: 'bot', content: '你那垃圾浏览器不支持websocket！这个功能玩不了~'}
      this.messages.push(temp)
      console.log("你那垃圾浏览器不支持websocket！这个功能玩不了~")
      return;
    } else {
      console.log("可以玩了")
    }
    this.ws = this.webSocketConnect("ws://localhost:8001/MyStep/ws/2799")
  },
  methods: {
    //下拉框点击方法
    handleCommand(command) {
      this.$message('click on item ' + command);
    },

    //websocket方法
    webSocketConnect(href) {
      const ws = new WebSocket(href);
      ws.addEventListener("open", this.webSocketOpen)
      ws.addEventListener("close", this.webSocketClose)
      ws.addEventListener("message", this.webSocketMessage)
      ws.addEventListener("error", this.webSocketError)
      return ws;
    },
    //websocket关闭回调
    webSocketClose() {
      console.log("websocket关上了");
      let temp={role: 'bot', content: 'websocket关上了，聊天停止'}
      this.messages.push(temp)
      if (this.isHandle){
        console.log("手动关闭websocket成功")
      }else {
        this.restar();
      }
      this.isHandle=false;
    },
    //收到消息回调
    webSocketMessage(message) {
      console.log("来自客户端的消息："+message.data)
      this.messages.push({
        role: 'bot',
        content: message.data
      })
    },
    //websocket报错回调
    webSocketError() {

    },
    //连接成功回调
    webSocketOpen() {
      let temp={role: 'bot', content: 'websocket连接成功,海皮吧？'}
      this.messages.push(temp)
    },
    //重连
    restar(){
      this.timer = setInterval(() => {
        console.log("webSocket服务端断开连接，正在准备申请重连")
        this.ws = this.webSocketConnect("ws://localhost:8001/MyStep/ws/2799")
        if (this.ws.readyState === 0) {//重连成功
          clearInterval(this.timer);
          this.timer=null;
          this.ws.addEventListener("open", this.webSocketOpen)
          this.ws.addEventListener("close", this.webSocketClose)
          this.ws.addEventListener("message", this.webSocketMessage)
          this.ws.addEventListener("error", this.webSocketError)
        }
      }, 1000)
    },
    //手动关闭websocket
    clossWebSocket(){
      this.isHandle=true;
      this.ws.close();
    },
    //手动连接
    openWebSocket(){
      if (typeof (WebSocket) == "undefined") {
        let temp={role: 'bot', content: '你那垃圾浏览器不支持websocket！这个功能玩不了~'}
        this.messages.push(temp)
        console.log("你那垃圾浏览器不支持websocket！这个功能玩不了~")
        return;
      } else {
        console.log("可以玩了")
      }
      this.ws = this.webSocketConnect("ws://localhost:8001/MyStep/ws/2799")
    },
    //发送消息
    senMessage(){
      this.ws.send("我发送了一条消息奥")
    },




    //对话框
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
        this.ws.send(userMessage)

        this.inputMessage = ''
        this.isLoading = true
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
  },
}

</script>

<style scoped>

.chat-container {
  width: 100%;
  max-width: 800px;
  margin: 0 auto;
  height: 85vh;
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