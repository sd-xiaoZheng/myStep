<template>
  <div :xl="6" :lg="7" class="bg-login">
    <!--logo-->
    <el-image :src="require('@/assets/avatar.jpg')" class="logo"/>
    <!--标题-->
    <el-row type="flex" class="row-bg row-two" justify="center" align="middle">
      <el-col :span="6"/>
      <el-col :span="6">
        <!--标题-->
        <h1 class="title">|====>Step<====|</h1>
      </el-col>
      <el-col :span="6"/>
    </el-row>
    <!--form表单-->
    <el-row type="flex" class="row-bg card" justify="center" align="bottom">
      <el-col :span="7" class="login-card">
        <!--loginForm-->
        <el-form
            v-if="isLogin"
            :model="loginForm"
            ref="loginForm"
            label-width="21%"
            class="loginForm"
        >
          <el-form-item label="账户" prop="phone" style="width: 380px">
            <el-input v-model="loginForm.phone" placeholder="请输入手机号"></el-input>
          </el-form-item>
          <el-form-item label="密码" prop="password" style="width: 380px">
            <el-input type="password" v-model="loginForm.password" placeholder="请输入密码"></el-input>
          </el-form-item>
          <el-form-item class="btn-ground">
            <el-button type="primary" @click="submitForm(loginForm)">立即登陆</el-button>
            <el-button @click="resetForm('loginForm')">重置</el-button>
            <el-button class="register-btn" @click="switchToRegister">注册</el-button>
          </el-form-item>
        </el-form>
        <!-- 注册表单 -->
        <el-form
            v-else
            :model="registerForm"
            ref="registerForm"
            label-width="21%"
            class="registerForm"
        >
          <el-form-item label="用户名" prop="username" style="width: 380px">
            <el-input v-model="registerForm.username" placeholder="请输入用户名"></el-input>
          </el-form-item>
          <el-form-item label="手机号" prop="phone" style="width: 380px">
            <el-input v-model="registerForm.phone" placeholder="请输入手机号"></el-input>
          </el-form-item>
          <el-form-item label="邮箱" prop="email" style="width: 380px">
            <el-input v-model="registerForm.email" placeholder="请输入邮箱"></el-input>
          </el-form-item>
          <el-form-item label="验证码" prop="code" style="width: 380px">
            <el-input v-model="registerForm.code" placeholder="请输入验证码"
                      style="width: 55%; float: left;"></el-input>
            <el-button
                type="primary"
                :disabled="isSendingCode"
                @click="sendEmailCode"
                style="float: right; margin-left: 10px;"
            >
              {{ buttonText }}
            </el-button>
          </el-form-item>
          <el-form-item label="密码" prop="password" style="width: 380px">
            <el-input type="password" v-model="registerForm.password" placeholder="请输入密码"></el-input>
          </el-form-item>
          <el-form-item class="btn-ground">
            <el-button type="primary" @click="submitRegisterForm(registerForm)">立即注册</el-button>
            <el-button @click="switchToLogin">返回登录</el-button>
          </el-form-item>
        </el-form>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import {login,register,sendCodeEmail} from '@/apis/api/login'

export default {
  name: "Login",
  data() {
    return {

      isLogin: true,
      registerForm: {
        username: '',
        phone: '',
        email: '',
        code: '',
        password: ''
      },
      registerRules: {
        username: [
          {required: true, message: '请输入用户名', trigger: 'blur'}
        ],
        phone: [
          {required: true, message: '请输入手机号', trigger: 'blur'},
          {pattern: /^1[3-9]\d{9}$/, message: '手机号格式不正确', trigger: 'blur'}
        ],
        email: [
          {required: true, message: '请输入邮箱', trigger: 'blur'},
          {type: 'email', message: '请输入正确的邮箱地址', trigger: 'blur'}
        ],
        code: [
          {required: true, message: '请输入验证码', trigger: 'blur'}
        ],
        password: [
          {required: true, message: '请输入密码', trigger: 'blur'}
        ]
      },
      isSendingCode: false,
      countdown: 60,
      buttonText: '发送验证码',


      // 表单信息
      loginForm: {
        // 账户数据
        phone: '',
        // 密码数据
        password: '',
        // // 验证码数据
        // code: '',
        // // 记住密码
        // remember: false,
        // // 验证码的key，因为前后端分离，这里验证码不能由后台存入session，所以交给vue状态管理
        // codeToken: ''
      },
      // 表单验证
      rules: {
        // 设置账户效验规则
        phone: [
          {required: true, message: '请输入账户', trigger: 'blur'},
          // {min: 11, max: 11, message: '长度为11位的手机号', trigger: 'blur'}
        ],
        // 设置密码效验规则
        password: [
          {required: true, message: '请输入密码', trigger: 'blur'},
          {min: 6, max: 15, message: '长度在 6 到 15 个字符的密码', trigger: 'blur'}
        ],
        // 设置验证码效验规则
        // code: [
        //   {required: true, message: '请输入验证码', trigger: 'blur'},
        //   {min: 5, max: 5, message: '长度为 5 个字符', trigger: 'blur'}
        // ]
      },
      // 绑定验证码图片
      codeImg: null
    };
  },


  created() {
    // 页面加载时，从本地存储中恢复状态
    const storedCountdown = localStorage.getItem('countdown');
    if (storedCountdown) {
      this.countdown = parseInt(storedCountdown);
      this.isSendingCode = true;
      this.buttonText = this.countdown + 's 后重试';
      this.startCountdown();
    }
  },
  methods: {
    // 提交表单
    submitForm(formName) {
      let params = {
        phone: this.loginForm.phone,
        password: this.loginForm.password
      }
      login(params).then((res) => {
        console.log(res)
        if (res.code === 200) {
          const token = res.data.token;
          // 将 token 存储到 sessionStorage 中
          window.sessionStorage.setItem('token', token);
          this.$message({
            message: res.message,
            type: 'success'
          });
          this.$router.push('/home');
        } else {
          this.$message.error(res.message);
        }
      })
    },
    // 重置表单
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },

    switchToRegister() {
      this.isLogin = false;
    },
    switchToLogin() {
      this.isLogin = true;
    },
    submitRegisterForm(form) {
      register(form).then((res)=>{
        console.log(res)
        if (res.code === 200) {
          this.$message({
            message: res.message,
            type: 'success'
          });
        } else {
          this.$message.error(res.message);
        }
      })
    },
    sendEmailCode() {
      if (this.registerForm.email){
        if (!this.isSendingCode) {
          this.isSendingCode = true;
          this.countdown = 10;
          this.buttonText = this.countdown + 's 后重试';
          this.startCountdown();
          let param={
            email:this.registerForm.email
          }
          sendCodeEmail(param).then((res)=>{
            console.log(res)
          })
          console.log('发送验证码到邮箱：', this.registerForm.email);
          // 存储倒计时信息到本地存储
          localStorage.setItem('countdown', this.countdown);
        }
      }else {
        this.$message.error("请输入邮箱");
      }
    },
    startCountdown() {
      const timer = setInterval(() => {
        this.countdown--;
        this.buttonText = this.countdown + 's 后重试';
        localStorage.setItem('countdown', this.countdown);
        if (this.countdown === 0) {
          clearInterval(timer);
          this.isSendingCode = false;
          this.buttonText = '发送验证码';
          // 清除本地存储中的倒计时信息
          localStorage.removeItem('countdown');
        }
      }, 1000);
    }
  },
}
</script>

<style scoped>
.codeImg {
  /*让验证码图片飘在右边*/
  float: right;
  /*设置一些圆角边框*/
  border-radius: 3px;
  /*设置宽度*/
  width: 26%;
}

.bg-login {
  height: 98vh;
  background-image: url("../assets/image/LoginBackground.jpg");
  background-size: 100%;
}

.btn-ground {
  text-align: center;
}

.logo {
  margin: 30px;
  height: 70px;
  width: 70px;
  position: fixed;
}

.title {
  text-shadow: -3px 3px 1px #5f565e;
  text-align: center;
  margin-top: 60%;
  color: #41b9a6;
  font-size: 40px;
}

.login-card {
  background-color: #ffffff;
  opacity: 0.85;
  box-shadow: 0 0 20px #ffffff;
  border-radius: 10px;
  padding: 40px 40px 30px 15px;
  width: auto;
}

.loginForm.btn-ground {
  display: flex;
  justify-content: space-between;
}

.register-btn {
  margin-left: 10px; /* 调整按钮之间的间距，可以根据需要修改 */
}

</style>
