<template>
  <div class="diary-list-manage">
    <!-- 顶部操作栏 -->
    <div class="operation-bar">
      <el-button type="primary" icon="el-icon-plus" @click="openAddDialog">
        添加日记
      </el-button>
      <!-- 添加搜索框 -->
      <el-input v-model="searchTitle" placeholder="请输入日记标题" style="width: 200px; margin-left: 20px;"
                @keyup.enter="() => getDiaryList(true)">
        <template #append>
          <el-button @click="() => getDiaryList(true)" :loading="searchLoading">搜索</el-button>
        </template>
      </el-input>
      <el-input v-model="searchContent" placeholder="请输入日记内容" style="width: 200px; margin-left: 20px;"
                @keyup.enter="() => getDiaryList(true)">
        <template #append>
          <el-button @click="() => getDiaryList(true)" :loading="searchLoading">搜索</el-button>
        </template>
      </el-input>
      <el-radio-group v-model="viewMode" class="filter-group">
        <el-radio-button label="all">全部</el-radio-button>
      </el-radio-group>
    </div>

    <!-- 表格展示 -->
    <el-table
        v-loading="loading"
        :data="diaryList"
        style="width: 100%">
<!--      <el-table-column prop="id" label="文章ID" width="80"></el-table-column>-->
      <el-table-column prop="typeName" label="类型" width="80"></el-table-column>
      <el-table-column prop="title" label="标题" min-width="150"></el-table-column>
      <el-table-column prop="content" label="内容" min-width="200">
        <template slot-scope="scope">
          <div class="content-cell">{{ scope.row.content }}</div>
        </template>
      </el-table-column>
      <el-table-column prop="authorName" label="作者名称" width="120"></el-table-column>
<!--      <el-table-column prop="authorId" label="作者ID" width="100"></el-table-column>-->
      <el-table-column label="写作时间" width="180">
        <template slot-scope="scope">
          {{ formatTime(scope.row.writeTime) }}
        </template>
      </el-table-column>
      <el-table-column label="记忆时间" width="180">
        <template slot-scope="scope">
          {{ formatTime(scope.row.memoryTime) }}
        </template>
      </el-table-column>
      <el-table-column prop="weatherName" label="天气" width="80"></el-table-column>
      <el-table-column prop="moodName" label="心情" width="80"></el-table-column>
      <el-table-column prop="color" label="展示颜色" width="100"></el-table-column>
      <el-table-column prop="isStar" label="是否星标" width="100">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.isStar" type="success">是</el-tag>
          <el-tag v-else type="info">否</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="address" label="发生地址" min-width="150"></el-table-column>
      <el-table-column label="图片" width="200">
        <template slot-scope="scope">
          <div class="images-container">
            <img
              v-for="(url, index) in getImageUrls(scope.row.imageUrls)"
              :key="index"
              :src="'/api'+url"
              class="image-item"
              alt="日记图片"
              loading="lazy"
            >
          </div>
        </template>
      </el-table-column>
      <el-table-column label="标签" width="200">
        <template slot-scope="scope">
          <div class="tags-container">
            <div
              v-for="tag in scope.row.tags"
              :key="tag.id"
              class="tag-item"
              :style="{ backgroundColor: tag.color, borderColor: tag.color }"
            >
              {{ tag.name }}
            </div>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="200vh" fixed="right">
        <template slot-scope="scope">
          <el-button type="primary" icon="el-icon-edit" circle size="mini" title="编辑"
                     @click="editDiary(scope.row)" :disabled="submitLoading"></el-button>
          <el-button type="danger" icon="el-icon-delete" circle size="mini" title="删除"
                     @click="deleteDiary(scope.row)" :disabled="deleteLoading"></el-button>
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

    <!-- 添加/编辑日记对话框 -->
    <el-dialog :visible.sync="dialogVisible" :title="dialogMode === 'add' ? '添加日记' : '编辑日记'" :modal="false">
      <el-form :model="diaryForm" :rules="rules" ref="diaryForm" label-width="100px">
        <el-form-item label="类型" prop="typeId">
          <el-select v-model="diaryForm.typeId" placeholder="请选择类型" style="width: 100%">
            <el-option
              v-for="item in typeOptions"
              :key="item.id"
              :label="item.name"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="标题" prop="title">
          <el-input v-model="diaryForm.title"></el-input>
        </el-form-item>
        <el-form-item label="内容" prop="content">
          <el-input type="textarea" v-model="diaryForm.content" :rows="4"></el-input>
        </el-form-item>
        <el-form-item label="记忆时间" prop="memoryTime">
          <el-date-picker
            v-model="diaryForm.memoryTime"
            type="datetime"
            placeholder="选择记忆时间"
            format="yyyy-MM-dd HH:mm:ss"
            value-format="yyyy-MM-dd HH:mm:ss">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="天气" prop="weatherId">
          <el-select v-model="diaryForm.weatherId" placeholder="请选择天气" style="width: 100%">
            <el-option
              v-for="item in weatherOptions"
              :key="item.id"
              :label="item.label"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="心情" prop="moodId">
          <el-select v-model="diaryForm.moodId" placeholder="请选择心情" style="width: 100%">
            <el-option
              v-for="item in moodOptions"
              :key="item.id"
              :label="item.name"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="标签">
          <el-select v-model="selectedTags" multiple placeholder="请选择标签" style="width: 100%">
            <el-option
              v-for="item in tagOptions"
              :key="item.id"
              :label="item.name"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="展示颜色" prop="color">
          <el-color-picker v-model="diaryForm.color"></el-color-picker>
        </el-form-item>
        <el-form-item label="是否星标" prop="isStar">
          <el-switch v-model="diaryForm.isStar"></el-switch>
        </el-form-item>
        <el-form-item label="发生地址" prop="address">
          <el-input v-model="diaryForm.address"></el-input>
        </el-form-item>
        <!-- 图片上传 -->
        <el-form-item label="图片">
          <div class="image-upload-container">
            <el-upload
              class="image-uploader"
              action=""
              :show-file-list="false"
              :before-upload="beforeImageUpload"
              :http-request="customUploadRequest"
              multiple
            >
              <div class="image-preview-area">
                <div
                  v-for="(image, index) in imagePreviews"
                  :key="index"
                  class="image-preview-item"
                  @click.stop
                >
                  <img :src="getImageSrc(image)" class="image-preview" alt="预览图片">
                  <div class="image-overlay">
                    <div class="image-actions">
                      <i class="el-icon-edit" @click="replaceImage(index)"></i>
                      <i class="el-icon-delete" @click="removeImage(index)"></i>
                    </div>
                  </div>
                </div>
                <div v-if="imagePreviews.length < 3" class="upload-placeholder">
                  <i class="el-icon-plus"></i>
                  <div class="upload-text">点击上传图片</div>
                </div>
              </div>
            </el-upload>
          </div>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="submitDiary" :loading="submitLoading" :disabled="submitLoading">
          {{ submitLoading ? '提交中...' : '确定' }}
        </el-button>
      </span>
    </el-dialog>
  </div>
</template>

<style scoped>
.diary-list-manage {
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

.content-cell {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.tags-container {
  display: flex;
  flex-wrap: wrap;
  gap: 5px;
}

.tag-item {
  padding: 2px 8px;
  border: 1px solid;
  border-radius: 4px;
  font-size: 12px;
  color: white;
  background-color: #909399;
  border-color: #909399;
}

.images-container {
  display: flex;
  flex-wrap: wrap;
  gap: 5px;
}

.image-item {
  width: 30px;
  height: 30px;
  object-fit: cover;
  border-radius: 4px;
  border: 1px solid #ddd;
}

.image-upload-container {
  width: 100%;
}

.image-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.image-uploader .el-upload:hover {
  border-color: #409EFF;
}

.image-preview-area {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
}

.image-preview-item {
  position: relative;
  width: 100px;
  height: 100px;
  border-radius: 4px;
  overflow: hidden;
  border: 1px solid #d9d9d9;
}

.image-preview {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.image-overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  align-items: center;
  justify-content: center;
  opacity: 0;
  transition: opacity 0.3s;
}

.image-preview-item:hover .image-overlay {
  opacity: 1;
}

.image-actions {
  color: white;
}

.image-actions i {
  cursor: pointer;
  margin: 0 5px;
  font-size: 16px;
}

.upload-placeholder {
  width: 100px;
  height: 100px;
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  color: #8c939d;
}

.upload-placeholder:hover {
  border-color: #409EFF;
}

.upload-text {
  font-size: 12px;
  margin-top: 5px;
}
</style>

<script>
import { getDiaryList, updateDiary } from '@/apis/api/diary'
import { getTypeList } from '@/apis/api/type'
import { getMoodList } from '@/apis/api/mood'
import { getWeatherList } from '@/apis/api/weather'
import { getTagList } from '@/apis/api/tag'

export default {
  data() {
    return {
      loading: false,
      searchLoading: false,
      deleteLoading: false,
      submitLoading: false,
      viewMode: 'all',
      diaryList: [],
      currentPage: 1,
      pageSize: 10,
      total: 0,
      searchTitle: '',
      searchContent: '',
      dialogVisible: false,
      dialogMode: 'add',
      diaryForm: {
        id: null,
        typeId: null,
        title: '',
        content: '',
        writeTime: '',
        memoryTime: '',
        weatherId: null,
        moodId: null,
        color: '',
        imageUrls: '',
        isStar: false,
        address: ''
      },
      // 下拉框选项
      typeOptions: [],
      moodOptions: [],
      weatherOptions: [],
      tagOptions: [],
      selectedTags: [], // 用于多选标签
      // 图片相关
      imageFiles: [], // 用于存储上传的图片文件
      imagePreviews: [], // 用于存储图片预览URL
      imageOriginalUrls: [], // 用于存储原始图片URL（编辑模式下）
      rules: {
        title: [
          { required: true, message: '请输入标题', trigger: 'blur' }
        ],
        content: [
          { required: true, message: '请输入内容', trigger: 'blur' }
        ]
      }
    }
  },
  async mounted() {
    this.getDiaryList()
    await this.loadOptions()
  },
  methods: {
    // 获取日记列表
    async getDiaryList(isSearch = false) {
      if (isSearch) {
        this.currentPage = 1
        this.searchLoading = true
      } else {
        this.loading = true
      }

      try {
        const params = {
          pageNum: this.currentPage,
          pageSize: this.pageSize,
          title: this.searchTitle || undefined,
          content: this.searchContent || undefined
        }

        const res = await getDiaryList(params)

        this.diaryList = res.rows || []
        this.total = res.total || 0

        if (isSearch) {
          this.searchLoading = false
        } else {
          this.loading = false
        }
      } catch (error) {
        console.error('获取日记列表失败:', error)
        this.$message.error('获取日记列表失败')

        if (isSearch) {
          this.searchLoading = false
        } else {
          this.loading = false
        }
      }
    },

    // 处理分页大小改变
    handleSizeChange(val) {
      this.pageSize = val
      this.getDiaryList()
    },

    // 处理当前页改变
    handleCurrentChange(val) {
      this.currentPage = val
      this.getDiaryList()
    },

    // 打开添加对话框
    openAddDialog() {
      this.dialogMode = 'add'
      this.diaryForm = {
        id: null,
        typeId: null,
        title: '',
        content: '',
        writeTime: '',
        memoryTime: '',
        weatherId: null,
        moodId: null,
        color: '',
        imageUrls: '',
        isStar: false,
        address: ''
      }
      this.selectedTags = []
      // 重置图片数据
      this.imageFiles = [];
      this.imagePreviews = [];
      this.imageOriginalUrls = [];
      this.dialogVisible = true
    },

    // 编辑日记
    editDiary(row) {
      this.dialogMode = 'edit'
      this.diaryForm = { ...row }
      // 处理标签数据
      if (row.tags && Array.isArray(row.tags)) {
        this.selectedTags = row.tags.map(tag => tag.id)
      } else {
        this.selectedTags = []
      }

      // 初始化图片
      this.initImagesForEdit(row)

      this.dialogVisible = true
    },

    // 提交日记（添加或编辑）
    async submitDiary() {
      try {
        await new Promise((resolve, reject) => {
          this.$refs.diaryForm.validate((valid) => {
            if (!valid) return reject('表单验证失败')
            resolve()
          })
        })

        this.submitLoading = true

        if (this.dialogMode === 'edit') {
          // 编辑模式，调用更新接口
          const formData = new FormData();
          
          // 添加普通字段（排除 tags 字段，只传 tagIds）
          Object.keys(this.diaryForm).forEach(key => {
            // 跳过 tags 字段，不传递 tags
            if (key === 'tags') {
              return;
            }
            if (this.diaryForm[key] !== null && this.diaryForm[key] !== undefined) {
              formData.append(key, this.diaryForm[key]);
            }
          });
          
          // 添加标签ID数组（使用 tagIds，不使用 tags）
          if (this.selectedTags && this.selectedTags.length > 0) {
            this.selectedTags.forEach(tagId => {
              formData.append('tagIds', tagId);
            });
          }
          
          // 处理图片更新
          // 构建 updateFile 数组：只有当有新文件时才添加到数组中
          let updateFileIndex = 0;
          if (this.imageFiles && this.imageFiles.length > 0) {
            for (let i = 0; i < this.imageFiles.length; i++) {
              const file = this.imageFiles[i];
              const originalUrl = this.imageOriginalUrls[i];
              
              // 只有当有新文件时，才需要添加到 updateFile
              if (file) {
                // 如果有原始URL，说明这是替换的图片；如果没有，说明这是新添加的图片
                // 当 oldUrl 为 null 时，发送空字符串，后端会将其解析为 null
                const oldUrl = originalUrl || '';
                formData.append(`updateFile[${updateFileIndex}].oldUrl`, oldUrl);
                formData.append(`updateFile[${updateFileIndex}].newImages`, file);
                updateFileIndex++;
              }
              // 如果 file 为 null 但 originalUrl 不为 null，说明图片保持原样，不需要发送
            }
          }

          // 调用更新API
          const res = await updateDiary(formData);

          if (res.code === 200) {
            this.$message.success('编辑成功');
          } else {
            throw new Error(res.message || '编辑失败');
          }
        } else {
          // 添加模式，暂时保持原有逻辑
          // 这里应该调用实际的API接口
          // 暂时模拟提交过程
          setTimeout(() => {
            this.submitLoading = false
            this.dialogVisible = false
            this.getDiaryList()
            this.$message.success(this.dialogMode === 'add' ? '添加成功' : '编辑成功')
          }, 500)
          return;
        }

        this.submitLoading = false
        this.dialogVisible = false
        this.getDiaryList()
        this.$message.success('编辑成功')
      } catch (error) {
        this.submitLoading = false
        console.error('提交日记失败:', error)
        this.$message.error(error.message || '操作失败，请稍后重试')
      }
    },

    // 删除日记
    async deleteDiary(row) {
      try {
        await this.$confirm('确认删除这篇日记吗？', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        })

        this.deleteLoading = true
        // 这里应该调用实际的API接口
        // 暂时模拟删除过程
        setTimeout(() => {
          this.deleteLoading = false
          this.getDiaryList()
          this.$message.success('删除成功')
        }, 500)
      } catch (error) {
        if (error !== 'cancel') {
          this.$message.info('已取消操作')
        }
        this.deleteLoading = false
      }
    },

    // 格式化时间
    formatTime(time) {
      if (!time) return ''

      // 如果是ISO字符串，转换为Date对象
      const date = typeof time === 'string' ? new Date(time) : time

      // 检查日期是否有效
      if (isNaN(date.getTime())) return time

      const year = date.getFullYear()
      const month = String(date.getMonth() + 1).padStart(2, '0')
      const day = String(date.getDate()).padStart(2, '0')
      const hours = String(date.getHours()).padStart(2, '0')
      const minutes = String(date.getMinutes()).padStart(2, '0')
      const seconds = String(date.getSeconds()).padStart(2, '0')

      return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`
    },

    // 处理图片URL
    getImageUrls(imageUrls) {
      if (!imageUrls) return []

      // 按逗号分割URL，并过滤掉空值
      const urls = imageUrls.split(',')
        .filter(url => url.trim() !== '')
        .map(url => url.trim())

      // 为每个URL添加/api前缀
      return urls.map(url => {
        // 如果URL已经是完整路径（以http或/开头），则不添加前缀
        if (url.startsWith('http') || url.startsWith('/')) {
          return url
        }
        // 否则添加/api前缀
        return '/api' + url
      }).filter(url => url !== '/api') // 过滤掉仅/api的情况
    },

    // 加载下拉框选项
    async loadOptions() {
      try {
        // 加载类型列表
        const typeRes = await getTypeList({})
        if (typeRes.code === 200) {
          this.typeOptions = typeRes.data
        }

        // 加载心情列表
        const moodRes = await getMoodList({})
        if (moodRes.code === 200) {
          this.moodOptions = moodRes.data
        }

        // 加载天气列表
        const weatherRes = await getWeatherList({})
        if (weatherRes.code === 200) {
          this.weatherOptions = weatherRes.data
        }

        // 加载标签列表
        const tagRes = await getTagList({})
        if (tagRes.code === 200) {
          this.tagOptions = tagRes.data
        }
      } catch (error) {
        console.error('加载选项失败:', error)
        this.$message.error('加载选项失败')
      }
    },

    // 处理图片上传前的验证
    beforeImageUpload(file) {
      const isImage = file.type.startsWith('image/')

      if (!isImage) {
        this.$message.error('只能上传图片文件!')
        return false
      }
      return true
    },

    // 自定义上传请求
    customUploadRequest(option) {
      const file = option.file

      // 将文件添加到imageFiles数组
      this.imageFiles.push(file)
      // 新上传的图片没有原始URL，设置为null
      this.imageOriginalUrls.push(null)

      // 创建预览URL
      const reader = new FileReader()
      reader.onload = (e) => {
        this.imagePreviews.push(e.target.result)
      }
      reader.readAsDataURL(file)
    },

    // 替换图片
    replaceImage(index) {
      // 创建一个隐藏的文件输入元素
      const input = document.createElement('input')
      input.type = 'file'
      input.accept = 'image/*'
      input.onchange = (e) => {
        const file = e.target.files[0]
        if (!file) return

        if (!this.beforeImageUpload(file)) {
          return
        }

        // 保存原始URL（如果存在）
        const originalUrl = this.imageOriginalUrls[index]

        // 替换文件
        this.imageFiles.splice(index, 1, file)
        // 保留原始URL（如果存在）
        if (originalUrl !== undefined) {
          this.imageOriginalUrls.splice(index, 1, originalUrl)
        } else {
          // 如果是新添加的图片被替换，原始URL仍为null
          this.imageOriginalUrls.splice(index, 1, null)
        }

        // 替换预览
        const reader = new FileReader()
        reader.onload = (e) => {
          this.imagePreviews.splice(index, 1, e.target.result)
        }
        reader.readAsDataURL(file)
      }
      input.click()
    },

    // 移除图片
    removeImage(index) {
      this.imageFiles.splice(index, 1)
      this.imagePreviews.splice(index, 1)
      this.imageOriginalUrls.splice(index, 1)
    },

    // 在编辑时初始化图片
    initImagesForEdit(row) {
      // 重置图片相关数据
      this.imageFiles = []
      this.imagePreviews = []
      this.imageOriginalUrls = []

      // 如果有现有图片，初始化预览
      if (row.imageUrls) {
        // 解析原始URL（去掉/api前缀）
        const originalUrls = row.imageUrls.split(',')
          .filter(url => url.trim() !== '')
          .map(url => url.trim())
        
        // 将现有图片URL作为预览添加（带/api前缀用于显示）
        const previewUrls = this.getImageUrls(row.imageUrls)
        this.imagePreviews = [...previewUrls]
        
        // 初始化对应位置的数据
        for (let i = 0; i < previewUrls.length; i++) {
          this.imageFiles.push(null) // 对于现有图片，初始时没有新文件
          // 保存原始URL（不带/api前缀）
          this.imageOriginalUrls.push(originalUrls[i] || null)
        }
      }
    },

    // 根据图片类型获取正确的src
    getImageSrc(image) {
      // 如果图片URL以 'data:' 开头，说明是base64编码的预览图片，直接返回
      if (image.startsWith('data:')) {
        return image;
      }
      return '/api' + image;
    }
  }
  }
</script>
