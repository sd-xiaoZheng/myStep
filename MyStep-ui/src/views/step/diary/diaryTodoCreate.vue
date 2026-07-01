<template>
  <div class="todo-create-page">
    <div class="todo-create-container">
      <!-- 面包屑导航 -->
      <div class="breadcrumb">
        <span class="breadcrumb-link" @click="$router.push('/diaryHome')">日记首页</span>
        <span class="breadcrumb-separator"> > </span>
        <span class="breadcrumb-current">新建代办</span>
      </div>

      <!-- 页面标题 -->
      <h1 class="page-title">> 新建代办 <</h1>

      <!-- 表单区域 -->
      <div class="form-section">
        <!-- 代办内容 -->
        <div class="form-group">
          <label class="form-label">代办内容 <span class="required">*</span></label>
          <textarea
            v-model="todo.content"
            placeholder="写下要做的事情..."
            class="content-textarea"
            @input="updateWordCount"
          ></textarea>
          <div class="input-footer">
            <span class="word-count">字数：{{ wordCount }}</span>
          </div>
        </div>

        <!-- 写作时间 -->
        <div class="form-group">
          <label class="form-label">写作时间</label>
          <div class="time-row">
            <input type="date" v-model="todo.writeDate" class="date-input">
            <input type="time" v-model="todo.writeTime" class="time-input">
          </div>
        </div>

        <!-- 是否星标 -->
        <div class="form-group">
          <label class="form-label">重要代办</label>
          <div class="star-row">
            <el-switch
              v-model="todo.isStar"
              active-color="#f1c40f"
              inactive-color="#bdc3c7"
            ></el-switch>
            <span class="star-label">{{ todo.isStar ? '⭐ 已星标，优先显示' : '开启星标' }}</span>
          </div>
        </div>
      </div>

      <!-- 底部操作按钮 -->
      <div class="action-buttons">
        <button class="btn-cancel" @click="cancel">取消</button>
        <button class="btn-save" @click="saveTodo">保存代办</button>
      </div>
    </div>
  </div>
</template>

<script>
import { addArticle } from '@/apis/api/article'

export default {
  name: 'DiaryTodoCreate',
  data() {
    const now = new Date()
    const todayStr = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`
    const timeStr = `${String(now.getHours()).padStart(2, '0')}:${String(now.getMinutes()).padStart(2, '0')}`

    return {
      todo: {
        content: '',
        writeDate: todayStr,
        writeTime: timeStr,
        isStar: false,
      },
      wordCount: 0,
      authorName: '',
    }
  },
  mounted() {
    this.loadAuthorFromToken()
  },
  methods: {
    /**
     * 从 JWT token 中解析用户名用于展示
     */
    loadAuthorFromToken() {
      try {
        const token = window.sessionStorage.getItem('token')
        if (token) {
          // JWT 格式: header.payload.signature
          const payload = token.split('.')[1]
          const decoded = JSON.parse(atob(payload))
          this.authorName = decoded.sub || decoded.username || decoded.nickname || ''
        }
      } catch (e) {
        console.warn('解析 token 获取用户名失败:', e)
      }
    },
    updateWordCount() {
      this.wordCount = this.todo.content.length
    },
    cancel() {
      this.$router.go(-1)
    },
    async saveTodo() {
      if (!this.todo.content.trim()) {
        this.$message.warning('请输入代办内容')
        return
      }

      try {
        const formData = new FormData()
        formData.append('content', this.todo.content)
        formData.append('typeId', 8) // 强制选择代办类型
        formData.append('isStar', this.todo.isStar)
        formData.append('title', '1')

        const res = await addArticle(formData)
        if (res.code === 200) {
          this.$message.success('代办保存成功！')
          this.$router.go(-1)
        } else {
          this.$message.error(res.msg || res.message || '代办保存失败')
        }
      } catch (error) {
        console.error('保存代办失败:', error)
        this.$message.error('保存代办时发生错误')
      }
    },
  },
}
</script>

<style scoped>
.todo-create-page {
  display: flex;
  justify-content: center;
  padding: 2rem;
  min-height: 100vh;
  background: linear-gradient(135deg, rgba(180, 170, 190, 0.85), rgba(220, 200, 190, 0.85), rgba(245, 235, 220, 0.85));
  background-size: 200% 200%;
  animation: gradientFlow 20s ease infinite;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

@keyframes gradientFlow {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}

.todo-create-container {
  width: 100%;
  max-width: 800px;
  background: rgba(255, 255, 255, 0.3);
  border-radius: 15px;
  padding: 2rem;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(10px);
  border: 1px solid rgba(255, 255, 255, 0.1);
  height: fit-content;
}

/* 面包屑 */
.breadcrumb {
  margin-bottom: 1rem;
  font-size: 0.9rem;
  color: #34495e;
}

.breadcrumb-link {
  color: #3498db;
  cursor: pointer;
}

.breadcrumb-link:hover {
  text-decoration: underline;
}

.breadcrumb-separator {
  margin: 0 0.5rem;
  color: #7f8c8d;
}

.breadcrumb-current {
  color: #2c3e50;
}

/* 页面标题 */
.page-title {
  font-size: 1.8rem;
  color: #2c3e50;
  margin-bottom: 2rem;
  text-align: center;
}

/* 表单区域 */
.form-section {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
  margin-bottom: 2rem;
}

.form-group {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.form-label {
  font-weight: bold;
  color: #2c3e50;
  font-size: 1rem;
}

.required {
  color: #e74c3c;
}

.form-hint {
  font-size: 0.8rem;
  color: #95a5a6;
}

/* 内容输入 */
.content-textarea {
  width: 100%;
  min-height: 200px;
  padding: 1rem;
  border: 1px solid #ddd;
  border-radius: 8px;
  font-family: inherit;
  font-size: 1rem;
  resize: vertical;
  background: rgba(255, 255, 255, 0.7);
  box-sizing: border-box;
}

.content-textarea:focus {
  outline: none;
  border-color: #3498db;
  box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
}

.input-footer {
  display: flex;
  justify-content: flex-end;
}

.word-count {
  color: #7f8c8d;
  font-size: 0.85rem;
}

/* 时间选择 */
.time-row {
  display: flex;
  gap: 1rem;
  align-items: center;
}

.date-input,
.time-input {
  padding: 0.6rem 0.8rem;
  border: 1px solid #ddd;
  border-radius: 8px;
  background: rgba(255, 255, 255, 0.7);
  font-size: 0.95rem;
}

.date-input:focus,
.time-input:focus {
  outline: none;
  border-color: #3498db;
}

/* 写作者 */
.author-row {
  padding: 0.6rem 0.8rem;
  background: rgba(255, 255, 255, 0.5);
  border-radius: 8px;
}

.author-name {
  color: #2c3e50;
  font-size: 0.95rem;
}

/* 星标开关 */
.star-row {
  display: flex;
  align-items: center;
  gap: 1rem;
}

.star-label {
  color: #7f8c8d;
  font-size: 0.9rem;
}

/* 底部操作按钮 */
.action-buttons {
  display: flex;
  justify-content: center;
  gap: 2rem;
}

.btn-cancel,
.btn-save {
  padding: 0.8rem 2rem;
  border: none;
  border-radius: 8px;
  font-size: 1rem;
  cursor: pointer;
  transition: all 0.3s ease;
}

.btn-cancel {
  background: #ecf0f1;
  color: #2c3e50;
}

.btn-cancel:hover {
  background: #bdc3c7;
}

.btn-save {
  background: linear-gradient(135deg, #e67e22, #d35400);
  color: white;
  box-shadow: 0 4px 16px rgba(230, 126, 34, 0.35);
}

.btn-save:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(230, 126, 34, 0.45);
}

@media (max-width: 768px) {
  .todo-create-page {
    padding: 1rem;
  }

  .todo-create-container {
    padding: 1rem;
  }

  .action-buttons {
    gap: 1rem;
  }
}
</style>
