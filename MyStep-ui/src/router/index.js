import Vue from 'vue';
import Router from 'vue-router';

// 公共页面
import login from '@/views/login.vue';
import menu from '@/views/menu.vue'; // layout 页面框架

// 功能页面（放在 layout 中）
import apiTest from '@/views/fun/apiTest.vue';
import redisTest from '@/views/fun/redisTest.vue';
import webSocket from '@/views/fun/webSocket.vue';
import webBugTest from '@/views/fun/webBugTest.vue';
import shop from '@/views/fun/shop.vue';
import snake from '@/views/fun/snake.vue';
import home from '@/views/fun/home.vue';

// 成长记录相关
import messageBoard from '@/views/step/board/messageBoard.vue';
import lifeTimeType from '@/views/step/lifeTime/lifeTimeType.vue';
import lifeTimeManage from '@/views/step/lifeTime/lifeTimeManage.vue';
import lifeTimePhoto from '@/views/step/lifeTime/lifeTimePhoto.vue';
import diaryHome from '@/views/step/diary/diaryHome.vue';
import diaryCreate from '@/views/step/diary/diaryCreate.vue';
import diaryTodoCreate from '@/views/step/diary/diaryTodoCreate.vue';
import diaryList from '@/views/step/diary/diaryList.vue';
import diaryManage from '@/views/step/diary/manage/diaryListManage.vue';
import typeManage from '@/views/manage/typeManage.vue';
import weatherManage from '@/views/manage/weatherManage.vue';
import moodManage from '@/views/manage/moodManage.vue';
import tagManage from '@/views/manage/tagManage.vue';


Vue.use(Router);

const router = new Router({
    mode: 'history', // 使用 history 模式（如你不配置 nginx，改成 hash）
    routes: [
        {
            path: '/login',
            name: 'login',
            component: login,
            meta: {
                title: "Step 登录"
            }
        },
        {
            path: '/menu',
            name: 'menu',
            component: menu,
            meta: {
                title: "MyStep",
            },
            children: [
                {
                    path: '/home',
                    name: 'home',
                    component: home,
                    meta: {
                        title: "首页"
                    }
                },
                {
                    path: '/apiTest',
                    name: 'apiTest',
                    component: apiTest,
                    meta: {
                        title: "接口测试"
                    }
                },
                {
                    path: '/redisTest',
                    name: 'redisTest',
                    component: redisTest,
                    meta: {
                        title: "Redis 测试"
                    }
                },
                {
                    path: '/webSocket',
                    name: 'webSocket',
                    component: webSocket,
                    meta: {
                        title: "WebSocket 测试"
                    }
                },
                {
                    path: '/webBugTest',
                    name: 'webBugTest',
                    component: webBugTest,
                    meta: {
                        title: "爬虫测试"
                    }
                },
                {
                    path: '/shop',
                    name: 'shop',
                    component: shop,
                    meta: {
                        title: "小商店"
                    }
                },
                {
                    path: '/snake',
                    name: 'snake',
                    component: snake,
                    meta: {
                        title: "贪吃蛇游戏"
                    }
                },
                {
                    path: '/messageBoard',
                    name: 'messageBoard',
                    component: messageBoard,
                    meta: {
                        title: "留言板"
                    }
                },
                {
                    path: '/lifeTimeType',
                    name: 'lifeTimeType',
                    component: lifeTimeType,
                    meta: {
                        title: "生命瞬间"
                    },
                },
                {
                    path: '/lifeTimeManage',
                    name: 'lifeTimeManage',
                    component: lifeTimeManage,
                    meta: {
                        title: "相册管理"
                    }
                },
                {
                    path: '/lifeTimePhoto',
                    name: '/lifeTimePhoto',
                    component: lifeTimePhoto,
                    meta: {
                        title: "生命瞬间"
                    }
                },
                {
                    path: '/diaryHome',
                    name: '/diaryHome',
                    component: diaryHome,
                    meta: {
                        title: "日记首页"
                    }
                },
                {
                    path: '/diaryCreate',
                    name: '/diaryCreate',
                    component: diaryCreate,
                    meta: {
                        title: "日记编辑"
                    }
                },
                {
                    path: '/diaryTodoCreate',
                    name: '/diaryTodoCreate',
                    component: diaryTodoCreate,
                    meta: {
                        title: "新建代办"
                    }
                },
                {
                    path: '/diaryList',
                    name: '/diaryList',
                    component: diaryList,
                    meta: {
                        title: "日记编辑"
                    }
                },
                {
                    path: '/diaryManage',
                    name: '/diaryManage',
                    component: diaryManage,
                    meta: {
                        title: "日记管理"
                    }
                },
                {
                    path: '/typeManage',
                    name: '/typeManage',
                    component: typeManage,
                    meta: {
                        title: "类型管理"
                    }
                },
                {
                    path: '/moodManage',
                    name: '/moodManage',
                    component: moodManage,
                    meta: {
                        title: "心情管理"
                    }
                },
                {
                    path: '/weatherManage',
                    name: '/weatherManage',
                    component: weatherManage,
                    meta: {
                        title: "天气管理"
                    }
                },
                {
                    path: '/tagManage',
                    name: '/tagManage',
                    component: tagManage,
                    meta: {
                        title: "天气管理"
                    }
                }
            ]
        }
    ]
});

// 页面标题控制 + 登录拦截
router.beforeEach((to, from, next) => {
    // 设置页面标题
    if (to.meta.title) {
        document.title = to.meta.title;
    }

    const token = sessionStorage.getItem('token');

    // 如果访问的是登录页，直接放行
    if (to.path === '/login' || to.path === '/') return next();

    // 如果没有 token，强制跳转回登录页
    if (!token) return next('/login');

    next();
});

export default router;
