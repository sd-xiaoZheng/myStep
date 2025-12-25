<template>
  <div class="tag-manage">
    <!-- 顶部操作栏 -->
    <div class="operation-bar">
      <el-input 
        v-model="searchName" 
        placeholder="请输入标签名称" 
        style="width: 200px; margin-right: 20px;"
        @keyup.enter.native="searchTags"
      >
        <template #append>
          <el-button @click="searchTags" :loading="searchLoading">
            <i class="el-icon-search"></i>
          </el-button>
        </template>
      </el-input>
      <el-button type="success" @click="openAddDialog" style="background-color: #40c463; border-color: #40c463; color: white;">
        Add Tag
      </el-button>
    </div>

    <!-- 标签卡片网格 -->
    <div class="tag-grid">
      <div 
        v-for="tag in tagList" 
        :key="tag.id" 
        class="tag-card"
        :style="{ backgroundColor: tag.color + '20', border: `2px solid ${tag.color}` }" 
        @mouseenter="hoveredCard = tag.id"
        @mouseleave="hoveredCard = null"
      >
        <!-- 标签名称 -->
        <div class="tag-name">{{ tag.name }}</div>
        
        <!-- 操作按钮 - 悬浮显示 -->
        <div class="card-actions" v-show="hoveredCard === tag.id">
          <el-button 
            type="primary" 
            icon="el-icon-edit" 
            size="mini" 
            circle 
            @click="editTag(tag)"
            class="action-btn edit-btn"
          ></el-button>
          <el-button 
            type="danger" 
            icon="el-icon-delete" 
            size="mini" 
            circle 
            @click="deleteTag(tag)"
            class="action-btn delete-btn"
          ></el-button>
        </div>
      </div>
    </div>

    <!-- 添加/编辑标签对话框 -->
    <el-dialog 
      :title="dialogMode === 'add' ? '添加标签' : '编辑标签'" 
      :visible.sync="dialogVisible"
      width="40%"
      :close-on-click-modal="false"
      :modal-append-to-body="false",
    >
      <el-form :model="tagForm" :rules="rules" ref="tagForm" label-width="100px">
        <el-form-item label="标签名称" prop="name">
          <el-input v-model="tagForm.name" placeholder="请输入标签名称"></el-input>
        </el-form-item>
        <el-form-item label="标签颜色" prop="color">
          <div class="color-picker-wrapper">
            <div
              class="color-preview"
              :style="{ backgroundColor: tagForm.color }"
              @click="openColorPicker"
            ></div>
            <input
              ref="colorInput"
              type="color"
              v-model="tagForm.color"
              class="color-input-hidden"
            >
            <span class="color-value">{{ tagForm.color }}</span>
          </div>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="submitTag" :loading="submitLoading">确定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { getTagList, addTag, updateTag, deleteTag } from '@/apis/api/tag'

export default {
  name: 'TagManage',
  data() {
    return {
      loading: false,
      searchLoading: false,
      submitLoading: false,
      tagList: [],
      searchName: '',
      dialogVisible: false,
      dialogMode: 'add',
      hoveredCard: null, // 当前鼠标悬停的卡片ID
      tagForm: {
        id: null,
        name: '',
        color: '#409EFF' // 默认颜色
      },
      rules: {
        name: [
          { required: true, message: '请输入标签名称', trigger: 'blur' }
        ],
        color: [
          { required: true, message: '请选择标签颜色', trigger: 'change' }
        ]
      }
    }
  },
  methods: {
    // 获取标签列表
    async getTagList(isSearch = false) {
      if (isSearch) {
        this.searchLoading = true
      } else {
        this.loading = true
      }

      try {
        const params = {
          name: this.searchName || undefined
        }

        const res = await getTagList(params)
        
        if (res.code === 200) {
          // 将接口返回的数据结构映射到组件期望的结构
          this.tagList = res.data.map(item => ({
            id: item.id,
            name: item.name,
            color: item.color
          }))
        } else {
          this.$message.error(res.message || '获取标签列表失败')
        }

        if (isSearch) {
          this.searchLoading = false
        } else {
          this.loading = false
        }
      } catch (error) {
        console.error('获取标签列表失败:', error)
        this.$message.error('获取标签列表失败')

        if (isSearch) {
          this.searchLoading = false
        } else {
          this.loading = false
        }
      }
    },

    // 搜索标签
    searchTags() {
      this.getTagList(true)
    },

    // 打开添加对话框
    openAddDialog() {
      this.dialogMode = 'add'
      this.tagForm = {
        id: null,
        name: '',
        color: '#409EFF' // 默认颜色
      }
      this.dialogVisible = true
    },

    // 编辑标签
    editTag(row) {
      this.dialogMode = 'edit'
      // 复制数据到表单
      this.tagForm = { 
        id: row.id,
        name: row.name,
        color: row.color
      }
      this.dialogVisible = true
    },

    // 打开颜色选择器
    openColorPicker() {
      this.$refs.colorInput.click()
    },

    // 提交标签（添加或编辑）
    async submitTag() {
      try {
        await this.$refs.tagForm.validate()
        this.submitLoading = true

        const submitData = { ...this.tagForm }

        if (this.dialogMode === 'add') {
          await addTag(submitData)
        } else {
          await updateTag(submitData)
        }

        this.submitLoading = false
        this.dialogVisible = false
        this.getTagList()
        this.$message.success(this.dialogMode === 'add' ? '添加成功' : '编辑成功')
      } catch (error) {
        this.submitLoading = false
        if (error !== 'cancel' && error.field !== undefined) {
          // 这是验证错误
          console.log('验证失败:', error)
        } else {
          this.$message.error('操作失败，请稍后重试')
        }
      }
    },

    // 删除标签
    async deleteTag(row) {
      try {
        await this.$confirm(`确认删除标签 "${row.name}" 吗？`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        })

        await deleteTag(row.id)
        
        this.getTagList()
        this.$message.success('删除成功')
      } catch (error) {
        if (error !== 'cancel') {
          this.$message.info('已取消操作')
        }
      }
    }
  },

  mounted() {
    this.getTagList()
  }
}
</script>

<style scoped>
.tag-manage {
  padding: 20px;
}

.operation-bar {
  margin-bottom: 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.tag-grid {
  display: grid;
  grid-template-columns: repeat(6, 1fr); /* 每行显示6个 */
  gap: 20px;
}

.tag-card {
  position: relative;
  border-radius: 8px;
  padding: 15px;
  text-align: center;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
  overflow: hidden;
  height: 120px; /* 固定高度以保持一致性 */
  display: flex;
  align-items: center;
  justify-content: center;
}

.tag-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 20px 0 rgba(0, 0, 0, 0.15);
}

.tag-name {
  font-size: 14px;
  font-weight: 500;
  word-break: break-all;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
  height: 40px;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* 使用更优雅的字体 */
}

.card-actions {
  position: absolute;
  top: 8px;
  right: 8px;
  z-index: 3;
  display: flex; /* 水平排列按钮 */
  flex-direction: row; /* 水平方向 */
  gap: 8px;
}

.action-btn {
  margin: 0 !important;
}

.edit-btn {
  background-color: #409EFF;
  border-color: #409EFF;
  color: white;
}

.delete-btn {
  background-color: #F56C6C;
  border-color: #F56C6C;
  color: white;
}

/* 为按钮添加霓虹效果 */
.operation-bar .el-button {
  position: relative;
  overflow: visible;
}

.operation-bar .el-button[type="success"] {
  background-color: #40c463;
  border-color: #40c463;
  color: white;
  box-shadow: 0 0 10px rgba(64, 196, 99, 0.5);
}

.operation-bar .el-button[type="success"]:hover {
  box-shadow: 0 0 20px rgba(64, 196, 99, 0.8);
}

/* 确保对话框在最顶层 */
.el-dialog {
  z-index: 9999 !important;
}

/* 确保对话框遮罩层在正确层级 */
.el-overlay-dialog {
  z-index: 9998 !important;
}

/* 颜色选择器样式 */
.color-picker-wrapper {
  position: relative;
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.color-preview {
  width: 30px;
  height: 30px;
  border-radius: 4px;
  cursor: pointer;
  border: 2px solid #ddd;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.color-value {
  font-size: 0.9rem;
  color: #7f8c8d;
}

/* 隐藏的颜色输入框 */
.color-input-hidden {
  position: absolute;
  visibility: hidden;
  width: 0;
  height: 0;
}
</style>