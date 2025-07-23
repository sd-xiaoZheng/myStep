<template>
  <div>
    <el-input v-model="pages" placeholder="请输入爬取页数"></el-input>
    <el-row>
      <el-button
          type="success"
          plain
          @click="executeBug"
          v-loading.fullscreen.lock="fullscreenLoading"
      >开爬！
      </el-button>
      <el-button
          type="info"
          @click="killMysql"
          plain
          v-loading.fullscreen.lock="fullscreenLoading"
      >强制清空数据库
      </el-button>
      <!--      <el-button type="warning" plain>警告按钮</el-button>-->
      <!--      <el-button type="danger" plain>危险按钮</el-button>-->
    </el-row>
    <el-table :data="questionList" style="width: 100%; margin-top: 20px;">
      <el-table-column prop="questionText" label="弱智问题"></el-table-column>
      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button type="danger" size="mini" @click="deleteQuestion(scope.$index)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      style="margin-top: 20px; text-align: right;"
      background
      layout="prev, pager, next, jumper, ->, total"
      :current-page="currentPage"
      :page-size="pageSize"
      :total="total"
      @current-change="handlePageChange"
    />
  </div>
</template>

<script>
import {Crawling, KillMysql,getQuestionText} from '@/apis/api/bug'

export default {
  name: "webBugTest",
  data() {
    return {
      currentPage: 1,
      pageSize: 20,
      total: 0,
      //loding
      fullscreenLoading: false,
      //爬取页数
      pages: '',
      // 问题列表
      questionList: [],
    };
  },
  created() {
    this.fetchQuestions();
  },
  methods: {
    executeBug() {
      this.fullscreenLoading = true;
      Crawling(this.pages).then((res) => {
        this.fullscreenLoading = false;
        if (res.code === 200) {
          this.$message({
            message: res.message,
            type: 'success'
          });
          this.pages = '';
        } else {
          this.$message.error(res.data.message);
        }
      })
    },
    killMysql() {
      this.fullscreenLoading = true;
      KillMysql().then((res)=>{
        this.fullscreenLoading = false;
        console.log(res)
        if (res.data.code === 200) {
          this.$message({
            message: res.data.message,
            type: 'success'
          });
        } else {
          this.$message.error(res.data.message);
        }
      }).finally(() => {
        this.fullscreenLoading = false;
      })
    },
    fetchQuestions() {
      let params = {
        pageNum: this.currentPage,
        pageSize: this.pageSize
      };
      getQuestionText(params).then(res=>{
        console.log('getQuestionText页面收到的id:', res);
        this.questionList=res.data.rows
        this.total=res.data.total
      })
    },
    deleteQuestion(index) {
      this.questionList.splice(index, 1);
    },
    handlePageChange(page) {
      this.currentPage = page;
      this.fetchQuestions();
    }
  }
}
</script>

<style scoped>

</style>
