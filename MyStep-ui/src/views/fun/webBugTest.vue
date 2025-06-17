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
  </div>
</template>

<script>
import {Crawling, KillMysql} from '@/apis/api/bug'

export default {
  name: "webBugTest",
  data() {
    return {
      //loding
      fullscreenLoading: false,
      //爬取页数
      pages: '',
    };
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
    }
  }
}
</script>

<style scoped>

</style>