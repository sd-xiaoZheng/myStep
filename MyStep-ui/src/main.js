import Vue from 'vue'
import App from './App.vue'
import VueRouter from 'vue-router'
import router from './router'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import '@/assets/styles/global.css';
import VueCompositionAPI from '@vue/composition-api'

Vue.config.productionTip = false

//使用vue-Router
Vue.use(VueRouter);
Vue.use(ElementUI);
Vue.use(VueCompositionAPI);

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')

