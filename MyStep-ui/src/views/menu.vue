<template>
  <div>
    <el-container>
      <el-header
          style="
          width:100%;
          text-align: right;
          font-size: 14px;
          height: 65px;
          display: flex; /* Added */
          align-items: center; /* Added */
          justify-content: flex-end; /* Added for right alignment */
          position: fixed;
          top: 0;
          left: 0;
          box-shadow:0px 0px 20px #333333;">
        <!--        <router-link class="routerClass" to="/apiTest">apiTest</router-link>-->
        <router-link to="/lifeTimeType" class="nav-item">
          <img src="@/assets/icon/life_time.png" class="nav-icon" alt="生命瞬间图标"/> 生命瞬间
        </router-link>
        <router-link to="/messageBoard" class="nav-item">
          <img src="@/assets/icon/leave_wall.png" class="nav-icon" alt="留言板图标"/> 留言板
        </router-link>
        <el-dropdown class="item nav-item" :show-timeout=0 :hide-timeout=180 @command="handleCommand">
            <span class="el-dropdown-link">
              <img src="@/assets/icon/tool_box.png" class="nav-icon" alt="工具图标"/> 工具箱<i
                class="el-icon-arrow-down el-icon--right"></i>
            </span>
          <el-dropdown-menu>
            <!--item中添加 disabled 元素 禁止点击,添加 divided 元素 置底-->
            <el-dropdown-item class="item" command="api">api</el-dropdown-item>
            <el-dropdown-item class="item" command="redis">redis</el-dropdown-item>
            <el-dropdown-item class="item" command="webSocket">webSocket</el-dropdown-item>
            <el-dropdown-item class="item" command="bug">百度贴吧爬虫</el-dropdown-item>
            <el-dropdown-item class="item" command="shop">商品购买</el-dropdown-item>
            <el-dropdown-item class="item" command="snake">贪吃蛇</el-dropdown-item>
            <el-dropdown-item class="item" divided command="home">回到首页</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>

        <el-dropdown class="item nav-item" :show-timeout=0 :hide-timeout=180 @command="handleCommand">
            <span class="el-dropdown-link">
              <img src="@/assets/icon/manage.png" class="nav-icon" alt="后台管理"/> 后台管理<i
                class="el-icon-arrow-down el-icon--right"></i>
            </span>
          <el-dropdown-menu>
            <!--item中添加 disabled 元素 禁止点击,添加 divided 元素 置底-->
            <el-dropdown-item class="item" command="photo">相册页面</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>


        <div class="header-right-items">
          <el-dropdown @command="handleScrew">
            <i class="el-icon-setting" style="margin-right: 15px"></i>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item command="loginOut">退出登录</el-dropdown-item>
              <el-dropdown-item command="handleAdd">新增</el-dropdown-item>
              <el-dropdown-item command="handleDelete">删除</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
          <div class="heard_img_div">
            <img class="heard_img"
                 src="https://foruda.gitee.com/avatar/1731375502035162094/13087640_zheng-work4j_1731375502.png!avatar200">
          </div>
        </div>
      </el-header>
      <el-main class="backGround" style="margin:-0.5vh;">
        <div style="height: 10vh;width: 5vh"></div>
        <router-view/>
      </el-main>
    </el-container>
  </div>
</template>

<script>

import {logout} from "@/apis/api/login";

export default {
  name: "home",
  data() {
    return {
      // 版本号
      version: "3.6.4",
    };
  },
  methods: {
    handleCommand(command) {
      let path = '';
      switch (command) {
        case "api":
          path = '/apiTest';
          break;
        case "redis":
          path = '/redisTest';
          break;
        case "webSocket":
          path = '/webSocket';
          break;
        case "bug":
          path = '/webBugTest';
          break;
        case "shop":
          path = '/shop';
          break;
        case "home":
          path = '/home';
          break;
        case "snake":
          path = '/snake';
          break;
        case "messageBoard":
          path = '/messageBoard';
          break;
        case "lifeTimeType":
          path = '/lifeTimeType';
          break;
        case "photo":
          path = '/lifeTimeManage';
          break;
        default:
          alert("没有该选项~");
          return;
      }
      if (path && this.$route.path !== path) {
        this.$router.push(path);
      }
      // this.$message('click on item ' + command);
    },
    handleScrew(command) {
      switch (command) {
        case "loginOut":
          logout().then((res) => {
            if (res.code === 200) {
              this.$message.success("退出成功");
              this.$router.push('/login');
            }
          })
          break;
        default:
          alert("没有该选项~");
          break;
      }
      // this.$message('click on item ' + command);
    }
  },
}
</script>

<style lang="less" scoped>
.header-right-items {
  margin-left: auto; /* Pushes the container to the right */
  display: flex;
  align-items: center; /* Vertically aligns items in the container */
  margin-right: 20px; /* Optional: Add some margin to the right edge */
  height: 100%; /* 确保容器高度与header一致 */
}

.el-icon-setting {
  font-size: 28px; /* 放大图标 */
  transition: transform 0.5s ease; /* 添加旋转过渡效果 */
  cursor: pointer; /* 增加手型光标 */
  color: #333; /* 设置颜色与整体风格统一 */
  display: flex;
  align-items: center;
  height: 100%;
}

.el-icon-setting:hover {
  transform: rotate(360deg); /* 悬停时旋转360度 */
}

.heard_img {
  border-radius: 10px;
  width: 4.5vh;
  height: 4.5vh;
  object-fit: cover;
}

.heard_img_div {
  width: 4.5vh;
  height: 4.5vh;
  background-image: image();
  position: relative;
  z-index: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: auto 5px; /* 使用auto来确保垂直方向上的margin自动计算 */
}

.backGround {
  position: absolute;
  width: 99.8%;
  z-index: -9999;
  background: linear-gradient(to right, rgba(143, 65, 233, 0.12), rgba(87, 138, 239, 0.12));
}

.el-dropdown-link {
  height: 100%; /* Added */
  display: inline-flex; /* Use flexbox for alignment */
  align-items: center; /* Center items vertically */
  cursor: pointer;
  color: #000000; /* Changed default color to black */
  transition: color 2s ease; /* Added color transition */
}

.nav-icon {
  width: 24px; /* Adjust size as needed */
  height: 24px; /* Adjust size as needed */
  vertical-align: middle; /* Align icon vertically with text */
  margin-right: 5px; /* Add some space between icon and text */
  transition: transform 0.3s ease; /* Add transition for smooth animation */
}

/* Define bounce animation */
@keyframes bounce {
  0%, 100% {
    transform: translateY(0);
  }
  50% {
    transform: translateY(-3px);
  }
}

/* Apply bounce animation on hover */
.nav-item:hover .nav-icon {
  animation: bounce 0.5s ease infinite; /* Apply bounce animation */
}

.nav-item {
  height: 100%; /* Added */
  display: inline-flex; /* Use flexbox for alignment */
  align-items: center; /* Center items vertically */
  color: #000000; /* Changed default color to black */
  margin-right: 20px;
  text-decoration: none;
  cursor: pointer;
  transition: color 2s ease; /* Changed color transition to 2s */
  font-size: 16px; /* Increased font size */
}

.el-dropdown-link {
  height: 100%; /* Added */
  display: inline-flex; /* Use flexbox for alignment */
  align-items: center; /* Center items vertically */
  cursor: pointer;
  color: #000000; /* Changed default color to black */
  transition: color 2s ease; /* Added color transition */
  font-size: 16px; /* Increased font size */
}

.nav-item:hover {
  color: #FFA94D; /* 柔和橙色，避免刺眼 */
  transition: color 0.5s ease;
}

/* Change dropdown link text color on hover */
.el-dropdown.nav-item:hover .el-dropdown-link {
  color: #FFA94D; /* 柔和橙色，避免刺眼 */
  transition: color 0.5s ease;
}

/* Apply transition to the icon itself */
.el-icon-arrow-down.el-icon--right {
  font-size: 14px;
  transition: transform 0.3s ease; /* 添加过渡效果 */
}

/* Rotate arrow on hover */
.el-dropdown.nav-item:hover .el-dropdown-link i.el-icon-arrow-down.el-icon--right {
  transform: rotate(180deg);
}

/* 当下拉菜单展开时旋转箭头 */
.el-dropdown.nav-item[aria-expanded="true"] .el-dropdown-link i.el-icon-arrow-down.el-icon--right {
  transform: rotate(180deg);
}

.el-header {
  background: linear-gradient(to right, rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 0.9));
  color: #333;
  line-height: 65px; /* Adjusted to match header height */
  height: 65px; /* Adjusted to match header height */
  display: flex; /* Added */
  align-items: center; /* Added */
}

.el-aside {
  color: #333;
}

.routerClass {
  float: left;
}

@keyframes shine {
  0% {
    background-position: -100%;
  }
  100% {
    background-position: 200%;
  }
}

@keyframes spike {
  0%, 100% {
    box-shadow: 0 0 0 0 rgba(255, 0, 0, 0);
  }
  50% {
    box-shadow: 0 0 10px 5px rgba(255, 0, 0, 0.5);
  }
}

.heard_img:hover {
  animation: spike 1s infinite; /* Apply spike animation on hover */
}

@keyframes wave {
  0% {
    transform: translateY(0);
    background-position: 0% 0%;
  }
  50% {
    transform: translateY(-5px);
    background-position: 100% 100%;
  }
  100% {
    transform: translateY(0);
    background-position: 0% 0%;
  }
}

.heard_img_div::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: -1;
  border-radius: 50%;
  animation: wave 2s infinite ease-in-out;
}
</style>