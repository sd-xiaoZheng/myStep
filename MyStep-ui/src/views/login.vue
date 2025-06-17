<template>
  <div :xl="6" :lg="7" class="bg-login" @mousemove="handleMouseMove" @click="handleClick">
    <canvas ref="canvas" class="mouse-canvas"></canvas>
    <!--logo-->
    <el-image :src="require('@/assets/avatar.jpg')" class="logo"/>
    <h1 class="title">|====>Step<====|</h1>
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
            <el-button type="primary" :loading="loading" @click="submitForm(loginForm)">立即登录</el-button>
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
      canAnimateLogo: true,
      canvas: null,
      ctx: null,
      points: [],
      ripples: [],
      lastTime: 0,

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
      // 添加loading状态
      loading: false,
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


  mounted() {
    this.initCanvas();
    requestAnimationFrame(this.animate);
    
    // 监听logo动画结束
    const logo = document.querySelector('.logo');
    logo.addEventListener('animationend', () => {
      // 动画结束后2秒才能再次触发
      setTimeout(() => {
        this.canAnimateLogo = true;
        logo.classList.add('can-animate');
      }, 2000);
    });
    
    // 监听logo hover
    logo.addEventListener('mouseenter', () => {
      // 只有在允许动画且没有动画正在执行时才触发
      if (this.canAnimateLogo && !logo.classList.contains('animating')) {
        this.canAnimateLogo = false;
        logo.classList.remove('can-animate');
        logo.classList.add('animating');
      }
    });
    
    // 监听动画开始
    logo.addEventListener('animationstart', () => {
      logo.style.pointerEvents = 'none';
    });
    
    // 监听动画结束，移除animating类
    logo.addEventListener('animationend', () => {
      logo.classList.remove('animating');
      // 动画结束后恢复pointer-events
      setTimeout(() => {
        logo.style.pointerEvents = 'auto';
      }, 2000);
    });
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
    initCanvas() {
      this.canvas = this.$refs.canvas;
      this.ctx = this.canvas.getContext('2d');
      this.resizeCanvas();
      window.addEventListener('resize', this.resizeCanvas);
    },
    resizeCanvas() {
      this.canvas.width = window.innerWidth;
      this.canvas.height = window.innerHeight;
    },
    handleMouseMove(e) {
      for (let i = 0; i < Math.random() * 3 + 5; i++) { // 每次移动产生5-8个粒子
        const meteor = {
          x: e.clientX + (Math.random() - 0.5) * 10, // 随机分散初始位置
          y: e.clientY + (Math.random() - 0.5) * 10,
          vx: (Math.random() - 0.5) * 3, // 增加速度变化
          vy: (Math.random() - 0.5) * 3,
          size: Math.random() * 1 + 1, // 减小粒子大小范围为1-2
          life: 0.8, // 缩短生命周期
          hue: (Date.now() * 0.1) % 360,
          trail: []
        };
        for (let i = 0; i < 5; i++) { // 增加拖尾点数
          meteor.trail.push({
            x: meteor.x,
            y: meteor.y,
            life: 1
          });
        }
        this.points.push(meteor);
      }
    },
    handleClick(e) {
      // 第一次爆炸：创建更多粒子
      for (let i = 0; i < 100; i++) {
        const angle = (Math.PI * 2 * i) / 100;
        const speed = Math.random() * 8 + 5; // 增加初始速度
        const size = Math.random() * 3 + 1;
        const particle = {
          x: e.clientX,
          y: e.clientY,
          vx: Math.cos(angle) * speed,
          vy: Math.sin(angle) * speed - Math.random() * 2, // 添加向上的初始速度
          size: size,
          originalSize: size,
          life: 1,
          hue: (Date.now() * 0.1 + i * 10) % 360,
          opacity: 1,
          rotationSpeed: (Math.random() - 0.5) * 0.2,
          // 添加二次爆炸属性
          canExplode: Math.random() < 0.3, // 30%的粒子会二次爆炸
          explodeTime: 0.3 + Math.random() * 0.3 // 在生命周期30%-60%时爆炸
        };
        this.ripples.push(particle);
      }
    },
    animate(currentTime) {
      const deltaTime = currentTime - this.lastTime;
      this.lastTime = currentTime;

      this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);

      // 更新和绘制流星轨迹
      for (let i = this.points.length - 1; i >= 0; i--) {
        const meteor = this.points[i];
        meteor.life -= deltaTime * 0.001;
        meteor.x += meteor.vx * deltaTime * 0.1;
        meteor.y += meteor.vy * deltaTime * 0.1;

        meteor.trail.push({ x: meteor.x, y: meteor.y, life: 1 });
        if (meteor.trail.length > 10) meteor.trail.shift();

        if (meteor.life <= 0) {
          this.points.splice(i, 1);
          continue;
        }

        this.ctx.beginPath();
        this.ctx.fillStyle = `hsla(${meteor.hue}, 100%, 70%, ${meteor.life})`;
        this.ctx.arc(meteor.x, meteor.y, meteor.size, 0, Math.PI * 2);
        this.ctx.fill();

        for (let j = 0; j < meteor.trail.length - 1; j++) {
          const t = meteor.trail[j];
          const nextT = meteor.trail[j + 1];
          const alpha = (j / meteor.trail.length) * meteor.life;

          this.ctx.beginPath();
          this.ctx.strokeStyle = `hsla(${meteor.hue}, 100%, 70%, ${alpha})`;
          this.ctx.lineWidth = meteor.size * (j / meteor.trail.length);
          this.ctx.moveTo(t.x, t.y);
          this.ctx.lineTo(nextT.x, nextT.y);
          this.ctx.stroke();
        }
      }

      // 更新和绘制爆炸粒子
      for (let i = this.ripples.length - 1; i >= 0; i--) {
        const particle = this.ripples[i];
        particle.life -= deltaTime * 0.0005;
        particle.x += particle.vx * deltaTime * 0.1;
        particle.y += particle.vy * deltaTime * 0.1;
        
        // 添加重力效果
        particle.vy += 0.15 * deltaTime * 0.1;
        
        // 检查是否需要二次爆炸
        if (particle.canExplode && particle.life < particle.explodeTime && particle.life > (particle.explodeTime - 0.1)) {
          particle.canExplode = false; // 防止多次爆炸
          // 创建二次爆炸粒子
          for (let j = 0; j < 8; j++) {
            const angle = (Math.PI * 2 * j) / 8;
            const speed = Math.random() * 4 + 2;
            const childParticle = {
              x: particle.x,
              y: particle.y,
              vx: Math.cos(angle) * speed,
              vy: Math.sin(angle) * speed,
              size: particle.size * 0.5,
              originalSize: particle.size * 0.5,
              life: 0.5,
              hue: particle.hue + Math.random() * 30 - 15,
              opacity: 1,
              rotationSpeed: (Math.random() - 0.5) * 0.2
            };
            this.ripples.push(childParticle);
          }
        }

        const sizeRatio = particle.life;
        particle.size = particle.originalSize * sizeRatio;
        particle.opacity = particle.life;

        if (particle.life <= 0) {
          this.ripples.splice(i, 1);
          continue;
        }

        this.ctx.save();
        this.ctx.translate(particle.x, particle.y);
        this.ctx.rotate(particle.rotationSpeed * currentTime * 0.01);
        
        this.ctx.beginPath();
        this.ctx.fillStyle = `hsla(${particle.hue}, 100%, 70%, ${particle.opacity})`;
        
        // 绘制星形粒子
        const spikes = 4;
        for (let j = 0; j < spikes * 2; j++) {
          const radius = j % 2 === 0 ? particle.size : particle.size * 0.5;
          const angle = (Math.PI * j) / spikes;
          const x = Math.cos(angle) * radius;
          const y = Math.sin(angle) * radius;
          j === 0 ? this.ctx.moveTo(x, y) : this.ctx.lineTo(x, y);
        }
        
        this.ctx.closePath();
        this.ctx.fill();
        
        // 添加发光效果
        this.ctx.shadowColor = `hsla(${particle.hue}, 100%, 70%, ${particle.opacity})`;
        this.ctx.shadowBlur = 15;
        this.ctx.fill();
        
        this.ctx.restore();
      }

      requestAnimationFrame(this.animate);
    },
    // 提交表单
    submitForm(formName) {
      if (this.loading) return; // 如果正在加载中，直接返回
      this.loading = true; // 开始加载
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
      }).catch(error => {
        this.$message.error('登录失败，请重试');
      }).finally(() => {
        this.loading = false; // 无论成功失败都结束加载状态
      });
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
.bg-login {
  height: 100vh;
  background-color: #1a1a1a;
  display: flex;
  flex-direction: column;
  align-items: center;
  position: relative;
  overflow: hidden;
}

.mouse-canvas {
  position: fixed;
  top: 0;
  left: 0;
  pointer-events: none;
  z-index: 1;
}

.bg-login::before {
  content: '';
  position: absolute;
  width: 200%;
  height: 200%;
  background: linear-gradient(45deg, #D4AF37 0%, #1a1a1a 25%, #333333 50%, #D4AF37 75%, #1a1a1a 100%);
  animation: gradient 15s linear infinite;
  opacity: 0.1;
}

@keyframes gradient {
  0% { transform: translate(-50%, -50%) rotate(0deg); }
  100% { transform: translate(-50%, -50%) rotate(360deg); }
}

.logo {
  margin: 20px;
  height: 60px;
  width: 60px;
  position: fixed;
  top: 0;
  left: 0;
  filter: drop-shadow(0 0 10px #D4AF37);
  transform-style: preserve-3d;
  perspective: 1000px;
  z-index: 2;
}

@keyframes logoRotate {
  from { transform: rotateY(0deg); filter: drop-shadow(0 0 10px #D4AF37); }
  to { transform: rotateY(180deg); filter: drop-shadow(0 0 15px #D4AF37); }
}

.logo:hover {
  animation: logoRotate 0.6s cubic-bezier(0.4, 0, 0.2, 1) forwards;
  animation-iteration-count: 1;
  pointer-events: none;
}

.logo.can-animate {
  pointer-events: auto;
}

.title {
  text-align: center;
  margin-bottom: 60px;
  color: #D4AF37;
  font-size: 48px;
  font-weight: bold;
  text-shadow: 0 0 10px rgba(212, 175, 55, 0.5);
  animation: glow 2s ease-in-out infinite alternate;
  position: absolute;
  top: 15vh;
  left: 50%;
  transform: translateX(-50%);
  z-index: 2;
}

@keyframes glow {
  from { text-shadow: 0 0 10px rgba(212, 175, 55, 0.5); }
  to { text-shadow: 0 0 20px rgba(212, 175, 55, 0.8), 0 0 30px rgba(212, 175, 55, 0.6); }
}

.login-card {
  background-color: rgba(26, 26, 26, 0.95);
  border: 1px solid #333333;
  box-shadow: 0 0 30px rgba(212, 175, 55, 0.2);
  border-radius: 15px;
  padding: 40px;
  width: auto;
  backdrop-filter: blur(10px);
  transform-style: preserve-3d;
  transition: transform 0.5s ease, box-shadow 0.5s ease;
  animation: float 6s ease-in-out infinite;
  position: relative;
  margin-top: 25vh;
}

@keyframes float {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-10px); }
}

.login-card:hover {
  box-shadow: 0 0 50px rgba(212, 175, 55, 0.3);
}

.el-input__inner {
  background-color: #333333 !important;
  border: 1px solid #D4AF37 !important;
  color: #D4AF37 !important;
  transition: all 0.3s ease;
}

.el-input__inner:focus {
  box-shadow: 0 0 10px rgba(212, 175, 55, 0.5) !important;
}

.el-form-item__label {
  color: #D4AF37 !important;
}

.el-button {
  background: linear-gradient(45deg, #D4AF37, #806515) !important;
  border: none !important;
  color: #1a1a1a !important;
  font-weight: bold !important;
  transition: all 0.3s ease !important;
  position: relative !important;
  overflow: hidden !important;
}

.el-button::before {
  content: '' !important;
  position: absolute !important;
  top: 50% !important;
  left: 50% !important;
  width: 0 !important;
  height: 0 !important;
  background: rgba(255, 255, 255, 0.2) !important;
  border-radius: 50% !important;
  transform: translate(-50%, -50%) !important;
  transition: width 0.6s ease, height 0.6s ease !important;
}

.el-button:hover::before {
  width: 300px !important;
  height: 300px !important;
}

.el-button:hover {
  transform: translateY(-2px) !important;
  box-shadow: 0 5px 15px rgba(212, 175, 55, 0.3) !important;
}

.btn-ground {
  text-align: center;
  margin-top: 20px;
}

.register-btn {
  margin-left: 10px;
}

.loginForm, .registerForm {
  opacity: 0;
  animation: fadeIn 0.5s ease forwards;
}

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

</style>
