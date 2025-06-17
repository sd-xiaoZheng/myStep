<template>
  <div class="lifetime-manage">
    <!-- 顶部操作栏 -->
    <div class="operation-bar">
      <el-button type="primary" icon="el-icon-upload" @click="openAddTypeDialog">
        添加类型
      </el-button>
      <!-- 添加搜索框 -->
      <el-input v-model="searchTypeName" placeholder="请输入类型名称" style="width: 200px; margin-left: 20px;"
                @keyup.enter="() => getPhotoTypeList(true)">
        <template #append>
          <el-button @click="() => getPhotoTypeList(true)">搜索</el-button>
        </template>
      </el-input>
      <el-radio-group v-model="viewMode" class="filter-group">
        <el-radio-button label="all">全部</el-radio-button>
      </el-radio-group>
    </div>

    <!-- 表格展示 -->
    <el-table
        v-loading="loading"
        :data="photoTypeList"
        style="width: 100%">
      <el-table-column label="封面" width="120">
        <template slot-scope="scope">
          <el-image
              style="width: 80px; height: 80px"
              :src="'/api'+scope.row.mainPhoto"
              :preview-src-list="['/api'+scope.row.mainPhoto]">
          </el-image>
        </template>
      </el-table-column>
      <el-table-column prop="typeName" label="类型名称" width="150"></el-table-column>
      <el-table-column prop="phrase" label="定格片语" min-width="200"></el-table-column>
      <el-table-column prop="favoriteCount" label="收藏数" width="100"></el-table-column>
      <el-table-column prop="photoCount" label="照片数" width="100"></el-table-column>
      <el-table-column prop="isHidden" label="是否隐藏" width="100">
        <template slot-scope="scope">
          <el-switch
              v-model="scope.row.isHidden"
              active-color="#13ce66"
              inactive-color="#ff4949">
          </el-switch>
        </template>
      </el-table-column>
      <el-table-column prop="updateTime" label="更新时间" width="180"></el-table-column>
      <el-table-column label="操作" width="125" fixed="right">
        <template slot-scope="scope">
          <el-button type="primary" icon="el-icon-edit" circle size="mini"
                     @click="editPhotoType(scope.row)"></el-button>
          <el-button type="info" icon="el-icon-brush" circle size="mini"
                     @click="addPhoto(scope.row.id)"></el-button>
          <el-button type="danger" icon="el-icon-delete" circle size="mini"
                     @click="moveToRecycleBin(scope.row)"></el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 分页 -->
    <div class="pagination-container">
      <el-pagination
          :current-page="currentPage"
          :page-size="pageSize"
          :page-sizes="[10, 20, 50, 100]"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
      />
    </div>

    <!-- 添加类型对话框 -->
    <el-dialog :visible.sync="addTypeDialogVisible" title="添加照片类型" :modal="false">
      <el-form :model="newTypeForm" :rules="rules" ref="newTypeForm" label-width="120px">
        <el-form-item label="类型名称" prop="type_name">
          <el-input v-model="newTypeForm.type_name"></el-input>
        </el-form-item>
        <el-form-item label="定格片语" prop="phrase">
          <el-input v-model="newTypeForm.phrase"></el-input>
        </el-form-item>
        <el-form-item label="排序" prop="sort_order">
          <el-input-number v-model="newTypeForm.sort_order" :min="0"></el-input-number>
        </el-form-item>
        <el-form-item label="是否隐藏">
          <el-switch v-model="newTypeForm.is_hidden"></el-switch>
        </el-form-item>
        <el-form-item label="封面图片" prop="tempPhoto">
          <el-upload
              action="#"
              :show-file-list="false"
              :auto-upload="false"
              :http-request="() => {}"
              :on-change="handlePhotoChange"
              accept="image/*">
            <img v-if="tempPhotoPreview" :src="tempPhotoPreview" class="avatar">
            <div v-else class="avatar-uploader">
              <i class="el-icon-plus avatar-uploader-icon"></i>
            </div>
          </el-upload>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="addTypeDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="submitNewType">确定</el-button>
      </span>
    </el-dialog>

    <el-dialog :visible.sync="addPhotoDialogVisible" title="添加图片" :modal="false">
      <!-- 上传区域：支持拖拽 -->
      <el-upload
          ref="uploadRef"
          drag
          action="https://your-api.com/upload"
          :auto-upload="false"
          multiple
          list-type="picture"
          :on-change="handleChange"
      >
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">将文件拖到此处，或点击上传</div>
      </el-upload>
      <!-- 手动上传按钮 -->
      <el-button
          type="primary"
          @click="submitUpload"
          style="margin-top: 20px;"
      >
        上传所有图片
      </el-button>
      <!-- 预览大图 -->
      <el-dialog :visible.sync="dialogVisible">
        <img height="500px" width="100%" :src="dialogImageUrl" alt="预览图片">
      </el-dialog>
    </el-dialog>
  </div>
</template>

<style scoped>
.lifetime-manage {
  padding: 20px;
}

.operation-bar {
  margin-bottom: 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.filter-group {
  margin-left: 20px;
}

.pagination-container {
  margin-top: 20px;
  display: flex;
  justify-content: center;
}

.avatar-uploader {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  width: 178px;
  height: 178px;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: border-color 0.3s;
}

.avatar-uploader:hover {
  border-color: #409EFF;
}

.avatar {
  width: 178px;
  height: 178px;
  display: block;
  object-fit: cover;
}

.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
}
</style>

<script>
import {addPhotoType, getPhotoTypeList, deletePhotoTypeList, editPhotoType, addPhoto} from '@/apis/api/lifeTimeManage'

export default {
  data() {
    return {
      fileList: [],
      dialogImageUrl: '',
      dialogVisible: false,
      isHidden: true,
      loading: false,
      viewMode: 'all',
      photoTypeList: [],
      currentPage: 1,
      pageSize: 20,
      total: 0,
      addTypeDialogVisible: false,
      addPhotoDialogVisible: false,
      dialogMode: 'add',
      newTypeForm: {
        type_name: '',
        phrase: '',
        sort_order: 99,
        is_hidden: false,
        tempPhoto: null
      },
      tempPhotoPreview: '',
      rules: {
        type_name: [
          {required: true, message: '请输入类型名称', trigger: 'blur'}
        ],
        phrase: [
          {required: true, message: '请输入片语', trigger: 'blur'}
        ],
        sort_order: [
          {required: true, message: '请输入排序', trigger: 'blur'}
        ]
      },
      searchTypeName: ''
    }
  },
  methods: {
    handleChange(file, fileList) {
      console.log(file)
      console.log(fileList)
      this.fileList = fileList;
    },
    submitUpload() {
      this.addPhoto();
      console.log(this.fileList)
    },
    addPhoto(row) {
      this.addPhotoDialogVisible = true
      console.log(row)
      let data = {
        photoTypeList: this.fileList,
        typeId: row
      }
    },
    editPhotoType(row) {
      this.dialogMode = 'edit'
      this.addTypeDialogVisible = true
      this.newTypeForm = {
        id: row.id,
        type_name: row.typeName,
        phrase: row.phrase,
        sort_order: row.sortOrder,
        is_hidden: row.isHidden,
        tempPhoto: row.tempPhoto
      }
      this.tempPhotoPreview = '/api' + row.mainPhoto
    },
    moveToRecycleBin(row) {
      this.$confirm('确认将该类型移入回收站吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let data = {
          id: row.id
        }
        deletePhotoTypeList(data).then((res) => {
          if (res.code === 200) {
            this.$message({
              type: 'success',
              message: '已移入回收站'
            })
            this.getPhotoTypeList()
          } else {
            this.$message({
              type: 'warning',
              message: res.msg
            })
          }
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消操作'
        })
      })
    },
    async getPhotoTypeList(isSearch = false) {
      if (isSearch) {
        this.currentPage = 1
      }
      this.loading = true
      let params = {
        pageNum: this.currentPage,
        pageSize: this.pageSize,
        typeName: this.searchTypeName || undefined
      }
      try {
        const response = await getPhotoTypeList(params)
        if (response.code === 200) {
          this.photoTypeList = response.rows
          this.total = response.total
        }
      } catch (error) {
        this.$message.error('获取照片类型列表失败')
      } finally {
        this.loading = false
      }
    },
    handleSizeChange(val) {
      this.pageSize = val
      this.getPhotoTypeList()
    },
    handleCurrentChange(val) {
      this.currentPage = val
      this.getPhotoTypeList()
    },
    openAddTypeDialog() {
      this.dialogMode = 'add'
      this.addTypeDialogVisible = true
      this.newTypeForm = {
        type_name: '',
        phrase: '',
        sort_order: 99,
        is_hidden: false,
        tempPhoto: null
      }
      this.tempPhotoPreview = ''
    },
    handlePhotoChange(file) {
      this.newTypeForm.tempPhoto = file.raw
      this.tempPhotoPreview = URL.createObjectURL(file.raw)
    },
    async submitNewType() {
      try {
        await new Promise((resolve, reject) => {
          this.$refs.newTypeForm.validate((valid) => {
            if (!valid) return reject('表单验证失败')
            resolve()
          })
        })
        if (!this.newTypeForm.tempPhoto) {
          this.$message.error('请上传封面图片')
          return
        }
        const formData = new FormData()
        if (this.dialogMode == 'edit') {
          formData.append('id', this.newTypeForm.id)
        }
        formData.append('typeName', this.newTypeForm.type_name)
        formData.append('phrase', this.newTypeForm.phrase)
        formData.append('sortOrder', this.newTypeForm.sort_order)
        formData.append('isHidden', this.newTypeForm.is_hidden)
        formData.append('tempPhoto', this.newTypeForm.tempPhoto)

        this.dialogMode == 'add' ?
            await addPhotoType(formData).then(res => {
              res.code === 200 ? this.$message.success(res.message) : this.$message.error(res.message)
            })
            :
            await editPhotoType(formData).then(res => {
              res.code === 200 ? this.$message.success(res.message) : this.$message.error(res.message)
            })
        this.addTypeDialogVisible = false
        this.getPhotoTypeList()
      } catch (error) {
        console.error('添加类型失败:', error)
        this.$message.error('添加类型失败，请稍后重试')
      }
    }
  },
  mounted() {
    this.getPhotoTypeList()
  }
}
</script>
