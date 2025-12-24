<template>
  <div class="type-manage">
    <!-- 顶部操作栏 -->
    <div class="operation-bar">
      <el-input
        v-model="searchName"
        placeholder="请输入类型名称"
        style="width: 200px; margin-right: 20px;"
        @keyup.enter.native="searchTypes"
      >
        <template #append>
          <el-button @click="searchTypes" :loading="searchLoading">
            <i class="el-icon-search"></i>
          </el-button>
        </template>
      </el-input>
      <el-button type="success" @click="openAddDialog" style="background-color: #40c463; border-color: #40c463; color: white;">
        Add Type
      </el-button>
    </div>

    <!-- 类型卡片网格 -->
    <div class="type-grid">
      <div
        v-for="type in typeList"
        :key="type.id"
        class="type-card"
        @mouseenter="hoveredCard = type.id"
        @mouseleave="hoveredCard = null"
      >
        <!-- 展示顺序 -->
        <div class="order-number">{{ type.sortNo }}</div>

        <!-- 图标 -->
        <div class="icon-container">
          <img :src="'/api'+type.icon" :alt="type.name" class="type-icon" v-if="type.icon" loading="lazy"/>
          <div v-else class="type-icon-placeholder">?</div>
        </div>

        <!-- 类型名称 -->
        <div class="type-name">{{ type.name }}</div>

        <!-- 操作按钮 - 悬浮显示 -->
        <div class="card-actions" v-show="hoveredCard === type.id">
          <el-button
            type="primary"
            icon="el-icon-edit"
            size="mini"
            circle
            @click="editType(type)"
            class="action-btn edit-btn"
          ></el-button>
          <el-button
            type="danger"
            icon="el-icon-delete"
            size="mini"
            circle
            @click="deleteType(type)"
            class="action-btn delete-btn"
          ></el-button>
        </div>
      </div>
    </div>

    <!-- 添加/编辑类型对话框 -->
    <el-dialog
      :title="dialogMode === 'add' ? '添加类型' : '编辑类型'"
      :visible.sync="dialogVisible"
      width="40%"
      :close-on-click-modal="false"
      :modal-append-to-body="false",
    >
      <el-form :model="typeForm" :rules="rules" ref="typeForm" label-width="100px">
        <el-form-item label="类型名称" prop="name">
          <el-input v-model="typeForm.name" placeholder="请输入类型名称"></el-input>
        </el-form-item>
        <el-form-item label="图标" prop="icon">
          <el-upload
            class="icon-uploader"
            action="#"
            :show-file-list="false"
            :on-change="handleIconChange"
            :auto-upload="false"
            :before-upload="beforeIconUpload"
            accept="image/*"
          >
            <img v-if="previewIconUrl" :src="previewIconUrl" class="icon-preview">
            <el-button v-else type="primary" icon="el-icon-plus" class="icon-upload-btn"></el-button>
          </el-upload>
<!--          <div class="icon-upload-tip" v-if="!previewIconUrl">支持 JPG/PNG/GIF/WebP 格式，建议尺寸 80x80</div>-->
        </el-form-item>
        <el-form-item label="排序号" prop="sortNo">
          <el-input-number v-model="typeForm.sortNo" :min="0" :max="999" placeholder="请输入排序号"></el-input-number>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="submitType" :loading="submitLoading">确定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { getTypeList, addType, updateType, deleteType } from '@/apis/api/type'

export default {
  name: 'TypeManage',
  data() {
    return {
      loading: false,
      searchLoading: false,
      submitLoading: false,
      typeList: [],
      searchName: '',
      dialogVisible: false,
      dialogMode: 'add',
      hoveredCard: null, // 当前鼠标悬停的卡片ID
      typeForm: {
        id: null,
        name: '',
        icon: '',
        sortNo: 0
      },
      rules: {
        name: [
          { required: true, message: '请输入类型名称', trigger: 'blur' }
        ],
        sortNo: [
          { required: true, message: '请输入排序号', trigger: 'blur' },
          { type: 'number', message: '排序号必须为数字', trigger: 'blur' }
        ]
      },
      currentFile: null, // 存储当前选择的文件
      previewIconUrl: '' // 预览图标URL
    }
  },
  methods: {
    // 获取类型列表
    async getTypeList(isSearch = false) {
      if (isSearch) {
        this.searchLoading = true
      } else {
        this.loading = true
      }

      try {
        const params = {
          name: this.searchName || undefined
        }

        const res = await getTypeList(params)

        if (res.code === 200) {
          // 将接口返回的数据结构映射到组件期望的结构
          this.typeList = res.data.map(item => ({
            id: item.id,
            name: item.name,
            icon: item.icon,
            sortNo: item.sortNo
          }))
        } else {
          this.$message.error(res.message || '获取类型列表失败')
        }

        if (isSearch) {
          this.searchLoading = false
        } else {
          this.loading = false
        }
      } catch (error) {
        console.error('获取类型列表失败:', error)
        this.$message.error('获取类型列表失败')

        if (isSearch) {
          this.searchLoading = false
        } else {
          this.loading = false
        }
      }
    },

    // 搜索类型
    searchTypes() {
      this.getTypeList(true)
    },

    // 打开添加对话框
    openAddDialog() {
      this.dialogMode = 'add'
      this.typeForm = {
        id: null,
        name: '',
        icon: '',
        sortNo: 0
      }
      this.currentFile = null // 重置文件
      this.previewIconUrl = '' // 重置预览
      this.dialogVisible = true
    },

    // 编辑类型
    editType(row) {
      this.dialogMode = 'edit'
      // 复制数据到表单
      this.typeForm = {
        id: row.id,
        name: row.name,
        icon: row.icon,
        sortNo: row.sortNo
      }
      this.currentFile = null // 重置文件
      // 设置预览图标为当前图标的完整路径
      this.previewIconUrl = '/api'+row.icon
      this.dialogVisible = true
    },

    // 图标上传前的验证
    beforeIconUpload(file) {
      const isImage = file.type.startsWith('image/')
      const isLt2M = file.size / 1024 / 1024 < 2

      if (!isImage) {
        this.$message.error('只能上传图片文件!')
      }
      if (!isLt2M) {
        this.$message.error('图片大小不能超过 2MB!')
      }
      return isImage && isLt2M
    },

    // 图标文件改变事件
    handleIconChange(file, fileList) {
      if (!this.beforeIconUpload(file.raw)) {
        return
      }

      // 显示预览
      const reader = new FileReader()
      reader.onload = (e) => {
        this.previewIconUrl = e.target.result
      }
      reader.readAsDataURL(file.raw)

      // 保存文件引用
      this.currentFile = file.raw
    },

    // 提交类型（添加或编辑）
    async submitType() {
      try {
        await this.$refs.typeForm.validate()
        this.submitLoading = true

        // 准备表单数据
        const formData = new FormData()
        formData.append('name', this.typeForm.name)
        formData.append('sortNo', this.typeForm.sortNo.toString())

        // 如果是编辑模式，添加ID
        if (this.dialogMode === 'edit') {
          formData.append('id', this.typeForm.id.toString())
        }

        // 如果有新上传的文件，则添加到formData
        if (this.currentFile) {
          formData.append('iconFile', this.currentFile)
        } else {
          // 如果没有新文件但有原始图标路径，也要设置图标路径
          if (this.typeForm.icon) {
            formData.append('icon', this.typeForm.icon)
          }
        }

        if (this.dialogMode === 'add') {
          await addType(formData)
        } else {
          await updateType(formData)
        }

        this.submitLoading = false
        this.dialogVisible = false
        this.getTypeList()
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

    // 删除类型
    async deleteType(row) {
      try {
        await this.$confirm(`确认删除类型 "${row.name}" 吗？`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        })

        await deleteType(row.id)

        this.getTypeList()
        this.$message.success('删除成功')
      } catch (error) {
        if (error !== 'cancel') {
          this.$message.info('已取消操作')
        }
      }
    }
  },

  mounted() {
    this.getTypeList()
  }
}
</script>

<style scoped>
.type-manage {
  padding: 20px;
}

.operation-bar {
  margin-bottom: 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.type-grid {
  display: grid;
  grid-template-columns: repeat(6, 1fr); /* 每行显示6个 */
  gap: 20px;
}

.type-card {
  position: relative;
  border: 1px solid #e4e7ed;
  border-radius: 8px;
  padding: 15px;
  text-align: center;
  background-color: white;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
  overflow: hidden;
  height: 180px; /* 固定高度以保持一致性 */
}

.type-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 20px 0 rgba(0, 0, 0, 0.15);
}

.order-number {
  position: absolute;
  top: 8px;
  left: 8px;
  background-color: #409EFF;
  color: white;
  border-radius: 50%;
  width: 24px;
  height: 24px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 12px;
  font-weight: bold;
  z-index: 2;
}

.icon-container {
  margin: 25px auto 10px;
  width: 80px;
  height: 80px;
}

.type-icon {
  width: 100%;
  height: 100%;
  border-radius: 50%;
  object-fit: cover;
}

.type-icon-placeholder {
  width: 100%;
  height: 100%;
  border-radius: 50%;
  background-color: #f0f0f0;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 24px;
  color: #909399;
}

.type-name {
  font-size: 14px;
  font-weight: 500;
  margin-top: 40px;
  word-break: break-all;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
  height: 40px;
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

/* 图标上传样式 */
.icon-uploader {
  display: inline-block;
}

.icon-preview {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  object-fit: cover;
  border: 1px dashed #d9d9d9;
}

.icon-upload-btn {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  border: 1px dashed #d9d9d9;
  cursor: pointer;
  outline: none;
}

.icon-upload-btn:hover {
  border-color: #409EFF;
  color: #409EFF;
}

.icon-upload-tip {
  margin-top: 10px;
  font-size: 12px;
  color: #909399;
}
</style>
