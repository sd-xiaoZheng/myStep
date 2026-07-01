<template>
  <div>
    <div class="diary-home">
    <!-- 顶部欢迎栏 -->
    <header class="welcome-bar">
      <div class="welcome-text">
        <h1>> 留下今日点滴 <</h1>
        <p>今天是 {{ currentDate }}</p>
      </div>
    </header>

    <!-- 顶部功能区 -->
    <section class="top-features">
      <!-- 模块 1: 快速新建 -->
      <div class="feature-card quick-create">
        <div class="card-header">
          <div class="card-icon-image">
            <img src="@/assets/icon/edit.png" alt="编辑" class="card-image-icon">
          </div>
          <h2>快速新建</h2>
        </div>
        <div class="card-buttons">
          <button class="btn btn-blue" @click="goToDiaryCreate">+ 新建日记</button>
          <button class="btn btn-grey" @click="goToTodoCreate"><span></span>新建代办</button>
        </div>
      </div>

      <!-- 模块 2: 今日待办 -->
      <div class="feature-card todo-list">
        <div class="card-header">
          <div class="card-icon-image">
            <img src="@/assets/icon/daiban.png" alt="待办" class="card-image-icon">
          </div>
          <h2>今日待办</h2>
          <button class="add-todo" @click="goToTodoCreate">+</button>
        </div>
        <ul>
          <li v-for="todo in displayTodoList" :key="todo.id">
            <input type="checkbox" :id="'card-' + todo.id" :checked="todo.title === '-1'" @change="toggleTodo(todo)">
            <label :for="'card-' + todo.id">{{ todo.content }}</label>
            <span class="delete-task" @click="deleteTodoItem(todo.id)">×</span>
          </li>
          <li v-if="todoList.length === 0" class="empty-todo">暂无待办，点击 + 添加</li>
        </ul>
        <a class="view-all" @click="showAllDialog = true">查看所有待办→</a>
      </div>

      <!-- 模块 3: 本月统计 -->
      <div class="feature-card monthly-stats">
        <div class="card-header">
          <div class="card-icon-image">
            <img src="@/assets/icon/tongji.png" alt="统计" class="card-image-icon">
          </div>
          <h2>本月统计</h2>
        </div>
        <div class="stats">
          <div class="stat-item">
            <span class="stat-number">15</span>
            <span class="stat-label">篇日记</span>
          </div>
          <div class="stat-item">
            <span class="stat-number">8</span>
            <span class="stat-label">天连续</span>
          </div>
        </div>
      </div>
    </section>

    <!-- 日记模块区 -->
    <section class="diary-modules">
      <h2>日记模块</h2>
      <div class="module-cards">
        <div
          v-for="item in moduleList"
          :key="item.typeId"
          :class="['module-card', { active: selectedTypeId === item.typeId }]"
          @click="filterDiaryByType(item.typeId)"
        >
          <div class="module-icon">
            <img v-if="item.icon" :src="item.icon" alt="" class="module-icon-img">
            <span v-else>📋</span>
          </div>
          <div class="module-info">
            <h3>{{ item.name }}</h3>
            <p>{{ item.description || '' }}</p>
          </div>
          <div class="module-count">{{ item.count }} 篇</div>
          <div class="module-arrow">→</div>
        </div>
      </div>
    </section>

    <!-- 最新日记区 -->
    <section class="latest-diaries">
      <div class="section-header">
        <h2>{{ selectedTypeId ? (typeMap[selectedTypeId] && typeMap[selectedTypeId].name) || '筛选日记' : '最新日记' }}</h2>
        <a class="view-all-link" @click="goToDiaryList">查看全部→</a>
      </div>
      <div class="diary-cards">
        <div
          v-for="diary in latestDiaries"
          :key="diary.id"
          class="diary-card"
        >
          <h3>{{ diary.title }}</h3>
          <p class="excerpt">{{ diary.preview }}</p>
          <div class="meta">
            <span class="date-time">{{ diary.date }}</span>
            <span v-if="diary.typeName" class="tag" :class="'type-tag-' + diary.typeId">{{ diary.typeName }}</span>
          </div>
        </div>
        <div v-if="latestDiaries.length === 0" class="empty-diary">暂无日记</div>
      </div>
    </section>
  </div>

  <!-- 所有待办弹窗 -->
  <el-dialog title="所有待办" :visible.sync="showAllDialog" width="600px" :close-on-click-modal="false" :append-to-body="true">
    <ul class="dialog-todo-list">
      <li v-for="todo in todoList" :key="todo.id">
        <input type="checkbox" :id="'dialog-' + todo.id" :checked="todo.title === '-1'" @change="toggleTodo(todo)">
        <label :for="'dialog-' + todo.id">{{ todo.content }}</label>
        <span class="delete-task" @click="deleteTodoItem(todo.id)">×</span>
      </li>
      <li v-if="todoList.length === 0" class="empty-todo">暂无待办</li>
    </ul>
  </el-dialog>
</div>
</template>

<script>
import { getTodoList, completeTodo, deleteTodo, getTypeStats, getFiltter, getArticleByFiltter } from '@/apis/api/article'

export default {
  name: 'CreateDiary',
  data() {
    return {
      currentDate: '',//今日日期
      todoList: [],//代办列表
      showAllDialog: false,//所有待办弹窗
      typeMap: {},//typeId → type对象（name、icon等）
      typeStats: [],//各type的文章数量统计
      selectedTypeId: null,//当前选中的类型（null=全部）
      latestDiaries: [],//最新日记列表
    }
  },
  computed: {
    // 只展示前3条
    displayTodoList() {
      return this.todoList.slice(0, 3)
    },
    // 按sort_no排序、带名称和图标的模块列表
    moduleList() {
      return this.typeStats.map(s => {
        const typeId = s.type_id || s.TYPE_ID
        const typeInfo = this.typeMap[typeId] || {}
        return {
          typeId: typeId,
          name: typeInfo.name || '未知',
          icon: typeInfo.icon || '',
          description: typeInfo.description || '',
          count: s.count || s.COUNT || 0
        }
      }).sort((a, b) => {
        const aSort = (this.typeMap[a.typeId] && this.typeMap[a.typeId].sortNo) || 99
        const bSort = (this.typeMap[b.typeId] && this.typeMap[b.typeId].sortNo) || 99
        return aSort - bSort
      })
    }
  },
  mounted() {
    this.onMounted();
    this.fetchTodoList();
    this.fetchModuleData();
  },
  methods: {
    onMounted() {
      const now = new Date()
      const year = now.getFullYear()
      const month = now.getMonth() + 1
      const day = now.getDate()
      this.currentDate= `${year} 年 ${month} 月 ${day} 日`
    },
    async fetchTodoList() {
      try {
        const res = await getTodoList()
        if (res.code === 200) {
          // 未完成的(title=1)排前面，已完成的(title=-1)排后面
          const list = res.data || []
          list.sort((a, b) => {
            if (a.title === '1' && b.title === '-1') return -1
            if (a.title === '-1' && b.title === '1') return 1
            return 0
          })
          this.todoList = list
        }
      } catch (e) {
        console.error('获取代办列表失败:', e)
      }
    },
    async toggleTodo(todo) {
      try {
        const res = await completeTodo(todo.id)
        if (res.code === 200) {
          todo.title = todo.title === '1' ? '-1' : '1'
          this.fetchTodoList()
        }
      } catch (e) {
        console.error('切换代办状态失败:', e)
      }
    },
    async deleteTodoItem(id) {
      try {
        const res = await deleteTodo(id)
        if (res.code === 200) {
          this.todoList = this.todoList.filter(t => t.id !== id)
        }
      } catch (e) {
        console.error('删除代办失败:', e)
      }
    },
    goToDiaryCreate() {
      this.$router.push('/diaryCreate');
    },
    async fetchModuleData() {
      try {
        const [statsRes, filterRes] = await Promise.all([getTypeStats(), getFiltter()])
        if (statsRes.code === 200) {
          this.typeStats = statsRes.data || []
        }
        if (filterRes.code === 200 && filterRes.data) {
          const types = filterRes.data.type || []
          const map = {}
          types.forEach(t => { map[t.id] = t })
          this.typeMap = map
        }
      } catch (e) {
        console.error('获取模块数据失败:', e)
      }
      this.fetchLatestDiaries()
    },
    async fetchLatestDiaries() {
      try {
        const params = { startTime: null, endTime: null, title: null, content: null, keyValueObj: [] }
        if (this.selectedTypeId) {
          params.keyValueObj.push({ key: 'type', value: this.selectedTypeId })
        }
        const res = await getArticleByFiltter(params)
        if (res.code === 200) {
          this.latestDiaries = (res.data || []).slice(0, 6).map(item => ({
            id: item.id,
            title: item.title,
            date: this.formatWriteTime(item.writeTime),
            preview: this.truncateContent(item.content, 80),
            typeName: item.typeName,
            typeId: item.typeId
          }))
        }
      } catch (e) {
        console.error('获取最新日记失败:', e)
      }
    },
    formatWriteTime(writeTime) {
      if (!writeTime) return ''
      const s = typeof writeTime === 'string' ? writeTime : ''
      return s.split('T')[0]
    },
    truncateContent(content, maxLen) {
      if (!content) return ''
      return content.length > maxLen ? content.substring(0, maxLen) + '...' : content
    },
    filterDiaryByType(typeId) {
      if (this.selectedTypeId === typeId) {
        this.selectedTypeId = null
      } else {
        this.selectedTypeId = typeId
      }
      this.fetchLatestDiaries()
    },
    goToDiaryList() {
      if (this.selectedTypeId) {
        this.$router.push({ path: '/diaryList', query: { typeId: String(this.selectedTypeId) } })
      } else {
        this.$router.push('/diaryList')
      }
    },
    goToTodoCreate() {
      this.$router.push('/diaryTodoCreate');
    }
  }
}
</script>

<style scoped>
/* General Styles */
.diary-home {
  /* 低饱和柔和渐变：浅紫灰+柔粉棕+暖米黄，模拟记忆的温润感 */
  background: linear-gradient(135deg, rgba(180, 170, 190, 0.85), rgba(220, 200, 190, 0.85), rgba(245, 235, 220, 0.85));
  color: #333333; /* 深灰色文字，提高与背景的对比度 */
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  padding: 2rem;
  min-height: 100vh;
  /* 渐变过渡自然，保留轻微流动感但更柔和 */
  background-size: 200% 200%;
  animation: gradientFlow 20s ease infinite; /* 放慢动画速度，更舒缓 */
  border-radius: 24px;
}

/* 更缓慢的渐变流动动画 */
@keyframes gradientFlow {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

a {
  color: #375a7f;
  text-decoration: none;
}

/* Welcome Bar */
.welcome-bar {
  margin-bottom: 2rem;
  text-align: center;
}

.welcome-text h1 {
  font-size: 2.5rem;
  margin: 0;
  color: #2c3e50;
  text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.welcome-text p {
  font-size: 1.1rem;
  color: #34495e;
  margin-top: 0.5rem;
}

/* Top Features Section */
.top-features {
  display: flex;
  gap: 1.5rem;
  margin-bottom: 3rem;
  align-items: stretch;
}

.feature-card {
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  border-radius: 15px;
  padding: 1.5rem;
  display: flex;
  flex-direction: column;
  border: 1px solid rgba(255, 255, 255, 0.1);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
  flex: 1; /* 让三个卡片宽度一致 */
}

.card-header {
  display: flex;
  align-items: center;
  margin-bottom: 1rem;
}

.card-icon-image {
  display: flex;
  justify-content: center;
  margin-right: 1rem;
}

.card-image-icon {
  width: 50px;
  height: 50px;
  object-fit: contain;
}

.card-header h2 {
  margin: 0;
  font-size: 1.3rem;
  color: #2c3e50;
  flex-grow: 1;
}

.btn {
  border: none;
  border-radius: 8px;
  padding: 0.8rem 1.5rem;
  cursor: pointer;
  font-weight: bold;
  width: 100%;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
}

.btn-blue {
  background: linear-gradient(135deg, #3498db, #2980b9);
  color: white;
  font-size: 1.2rem;
  margin-bottom: 0.5rem;
}

.btn-blue:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
}

.btn-grey span {
  display: inline-block;
  width: 10px;
  height: 10px;
  position: relative;
  margin-right: 8px;
  background: transparent; /* 去掉原圆点背景 */
}
/* 横向线条 */
.btn-grey span::before {
  content: '';
  position: absolute;
  top: 50%;
  left: 0;
  width: 100%;
  height: 2px;
  background: #f1c40f;
  transform: translateY(-50%);
}
/* 纵向线条 */
.btn-grey span::after {
  content: '';
  position: absolute;
  left: 50%;
  top: 0;
  width: 2px;
  height: 100%;
  background: #f1c40f;
  transform: translateX(-50%);
}

.btn-grey span {
  width: 12px;   /* 改大小 */
  height: 12px;
  background-color: #27ae60; /* 改颜色 */
}


.card-buttons {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

/* Todo List */
.add-todo {
  background: rgba(236, 240, 241, 0.7);
  color: #2c3e50;
  border: 1px solid rgba(255, 255, 255, 0.1);
  border-radius: 50%;
  width: 30px;
  height: 30px;
  font-size: 1.5rem;
  line-height: 28px;
  text-align: center;
  cursor: pointer;
  transition: all 0.5s ease;
}

.add-todo:hover {
  background: rgba(236, 240, 241, 0.9);
  transform: rotate(180deg);
}

.todo-list ul {
  list-style: none;
  padding: 0;
  margin: 0 0 1rem 0;
  flex-grow: 1;
}

.todo-list li {
  display: flex;
  align-items: center;
  padding: 0.7rem 0;
  color: #34495e;
  border-bottom: 1px solid rgba(0, 0, 0, 0.05);
}

.todo-list li:last-child {
  border-bottom: none;
}

.todo-list li input[type="checkbox"] {
  margin-right: 10px;
  width: 18px;
  height: 18px;
  cursor: pointer;
}

.todo-list li label {
  flex-grow: 1;
  cursor: pointer;
}

.todo-list li input[type="checkbox"]:checked + label {
  text-decoration: line-through;
  color: #7f8c8d;
}

.delete-task {
  color: #e74c3c;
  cursor: pointer;
  font-weight: bold;
  padding: 0 5px;
  opacity: 0.7;
  transition: opacity 0.3s ease;
}

.delete-task:hover {
  opacity: 1;
}

.empty-todo {
  color: #95a5a6;
  font-size: 0.9rem;
  text-align: center;
  padding: 1rem 0;
  border-bottom: none !important;
}

.view-all {
  font-size: 0.9rem;
  align-self: flex-end;
  color: #3498db;
  font-weight: 500;
  cursor: pointer;
}

/* 弹窗内的代办列表 */
.dialog-todo-list {
  list-style: none;
  padding: 0;
  margin: 0;
  max-height: 50vh;
  overflow-y: auto;
}

.dialog-todo-list li {
  display: flex;
  align-items: center;
  padding: 0.7rem 0;
  color: #34495e;
  border-bottom: 1px solid rgba(0, 0, 0, 0.05);
}

.dialog-todo-list li:last-child {
  border-bottom: none;
}

.dialog-todo-list li input[type="checkbox"] {
  margin-right: 10px;
  width: 18px;
  height: 18px;
  cursor: pointer;
}

.dialog-todo-list li label {
  flex-grow: 1;
  cursor: pointer;
}

.dialog-todo-list li input[type="checkbox"]:checked + label {
  text-decoration: line-through;
  color: #7f8c8d;
}

/* Monthly Stats */
.monthly-stats .stats {
  display: flex;
  gap: 2rem;
  align-items: center;
  justify-content: center;
  height: 100%;
}

.monthly-stats .stat-item {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.stat-number {
  font-size: 2.5rem;
  font-weight: bold;
  color: #2c3e50;
  text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.stat-label {
  font-size: 0.9rem;
  color: #34495e;
  margin-top: 0.3rem;
}

/* Diary Modules Section */
.diary-modules {
  margin-bottom: 3rem;
}

.diary-modules h2 {
  background: linear-gradient(135deg, #3498db, #8e44ad);
  color: #ffffff;
  padding: 0.5rem 1.5rem;
  display: inline-block;
  margin-bottom: 1.5rem;
  font-size: 1.3rem;
  border-radius: 30px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.module-cards {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 1.5rem;
}

.module-card {
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  border-radius: 15px;
  padding: 1.5rem;
  display: flex;
  align-items: center;
  gap: 1rem;
  cursor: pointer;
  transition: all 0.3s ease;
  border: 1px solid rgba(255, 255, 255, 0.1);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}

.module-card:hover {
  transform: translateY(-5px);
  background: rgba(255, 255, 255, 0.9);
  box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
}

.module-card.active {
  background: rgba(255, 255, 255, 0.95);
  border: 2px solid #3498db;
  box-shadow: 0 8px 32px rgba(52, 152, 219, 0.2);
}

.module-icon {
  font-size: 2rem;
  width: 40px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
}

.module-icon-img {
  width: 100%;
  height: 100%;
  object-fit: contain;
}

.module-info {
  flex-grow: 1;
}

.module-info h3 {
  margin: 0 0 0.3rem 0;
  color: #2c3e50;
  font-size: 1.1rem;
}

.module-info p {
  margin: 0;
  font-size: 0.9rem;
  color: #34495e;
}

.module-count {
  background: rgba(236, 240, 241, 0.7);
  padding: 0.3rem 0.8rem;
  border-radius: 15px;
  font-size: 0.9rem;
  color: #2c3e50;
  white-space: nowrap;
  border: 1px solid rgba(255, 255, 255, 0.1);
}

.module-arrow {
  font-size: 1.5rem;
  color: #34495e;
}

/* Latest Diaries Section */
.latest-diaries .section-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 1.5rem;
}

.latest-diaries h2 {
  font-size: 1.3rem;
  color: #2c3e50;
  margin: 0;
}

.view-all-link {
  font-size: 0.9rem;
  color: #3498db;
  font-weight: 500;
  cursor: pointer;
}

.diary-cards {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 1.5rem;
}

.diary-card {
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  border-radius: 15px;
  padding: 1.5rem;
  cursor: pointer;
  transition: all 0.3s ease;
  border: 1px solid rgba(255, 255, 255, 0.5);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}

.diary-card:hover {
  transform: translateY(-5px);
  background: rgba(255, 255, 255, 0.9);
  box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
}

.empty-diary {
  color: #95a5a6;
  font-size: 0.95rem;
  text-align: center;
  padding: 2rem 0;
  grid-column: 1 / -1;
}

.diary-card h3 {
  margin: 0 0 0.5rem 0;
  color: #2c3e50;
  font-size: 1.2rem;
}

.diary-card .excerpt {
  margin: 0 0 1rem 0;
  font-size: 0.95rem;
  color: #34495e;
  line-height: 1.5;
}

.diary-card .meta {
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  gap: 1rem;
  font-size: 0.85rem;
  color: #34495e;
}

.tag {
  padding: 0.3rem 0.8rem;
  border-radius: 5px;
  font-weight: bold;
}

.diary-tag {
  background: linear-gradient(135deg, rgba(52, 152, 219, 0.3), rgba(26, 82, 118, 0.3));
  color: #3498db;
  border: 1px solid rgba(52, 152, 219, 0.3);
}

.reflection-tag {
  background: linear-gradient(135deg, rgba(230, 126, 34, 0.3), rgba(156, 84, 16, 0.3));
  color: #e67e22;
  border: 1px solid rgba(230, 126, 34, 0.3);
}

@media (max-width: 1200px) {
  .top-features {
    flex-wrap: wrap;
  }

  .feature-card {
    flex-basis: calc(50% - 0.75rem);
  }

  .todo-list {
    flex-basis: 100%;
    order: 3;
  }
}

@media (max-width: 768px) {
  .module-cards {
    grid-template-columns: 1fr;
  }

  .diary-cards {
    grid-template-columns: 1fr;
  }

  .feature-card {
    flex-basis: 100%;
  }

  .welcome-text h1 {
    font-size: 2rem;
  }

  .welcome-text p {
    font-size: 1rem;
  }

  .diary-home {
    padding: 1rem;
  }
}
</style>
