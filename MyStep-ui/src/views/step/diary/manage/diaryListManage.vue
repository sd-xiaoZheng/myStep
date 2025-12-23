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
      <el-table-column prop="typeId" label="类型ID" width="80"></el-table-column>
      <el-table-column prop="title" label="标题" min-width="150"></el-table-column>
      <el-table-column prop="content" label="内容" min-width="200">
        <template slot-scope="scope">
          <div class="content-cell">{{ scope.row.content }}</div>
        </template>
      </el-table-column>
      <el-table-column prop="authorName" label="作者名称" width="120"></el-table-column>
      <el-table-column prop="authorId" label="作者ID" width="100"></el-table-column>
      <el-table-column prop="writeTime" label="写作时间" width="180"></el-table-column>
      <el-table-column prop="memoryTime" label="记忆时间" width="180"></el-table-column>
      <el-table-column prop="weatherId" label="天气ID" width="80"></el-table-column>
      <el-table-column prop="moodId" label="心情ID" width="80"></el-table-column>
      <el-table-column prop="color" label="展示颜色" width="100"></el-table-column>
      <el-table-column prop="isStar" label="是否星标" width="100">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.isStar" type="success">是</el-tag>
          <el-tag v-else type="info">否</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="address" label="发生地址" min-width="150"></el-table-column>
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
        <el-form-item label="类型ID" prop="typeId">
          <el-input v-model.number="diaryForm.typeId"></el-input>
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
        <el-form-item label="天气ID" prop="weatherId">
          <el-input v-model.number="diaryForm.weatherId"></el-input>
        </el-form-item>
        <el-form-item label="心情ID" prop="moodId">
          <el-input v-model.number="diaryForm.moodId"></el-input>
        </el-form-item>
        <el-form-item label="作者名称" prop="authorName">
          <el-input v-model="diaryForm.authorName"></el-input>
        </el-form-item>
        <el-form-item label="作者ID" prop="authorId">
          <el-input v-model="diaryForm.authorId"></el-input>
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
</style>

<script>
import { getDiaryList } from '@/apis/api/diary'

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
        authorName: '',
        authorId: '',
        authorAvatar: '',
        color: '',
        imageUrls: '',
        isStar: false,
        address: ''
      },
      rules: {
        title: [
          { required: true, message: '请输入标题', trigger: 'blur' }
        ],
        content: [
          { required: true, message: '请输入内容', trigger: 'blur' }
        ],
        authorName: [
          { required: true, message: '请输入作者名称', trigger: 'blur' }
        ],
        authorId: [
          { required: true, message: '请输入作者ID', trigger: 'blur' }
        ]
      }
    }
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
        authorName: '',
        authorId: '',
        authorAvatar: '',
        color: '',
        imageUrls: '',
        isStar: false,
        address: ''
      }
      this.dialogVisible = true
    },

    // 编辑日记
    editDiary(row) {
      this.dialogMode = 'edit'
      this.diaryForm = { ...row }
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
        // 这里应该调用实际的API接口
        // 暂时模拟提交过程
        setTimeout(() => {
          this.submitLoading = false
          this.dialogVisible = false
          this.getDiaryList()
          this.$message.success(this.dialogMode === 'add' ? '添加成功' : '编辑成功')
        }, 500)
      } catch (error) {
        this.submitLoading = false
        this.$message.error('操作失败，请稍后重试')
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
    }
  },

  mounted() {
    this.getDiaryList()
  }
}
</script>
