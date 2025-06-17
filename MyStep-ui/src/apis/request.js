/**
 * ajax请求配置
 */
import axios from 'axios'
import router from '../router';

// axios默认配置
axios.defaults.timeout = 30000 // 超时时间
// axios.defaults.baseURL 请求地址前缀
// User地址
// axios.defaults.baseURL = 'http://127.0.0.1:8001'
// tools地址
// axios.defaults.baseURL = 'http://127.0.0.1:8088'
// 微服务地址
axios.defaults.baseURL = '/api'

// 整理数据
axios.defaults.transformRequest = function (data) {
    const temp=data instanceof FormData
    return temp?data : JSON.stringify(data)
}
// 路由请求拦截
axios.interceptors.request.use(
    config => {
        if (config.headers['Content-Type'] != 'multipart/form-data') {
            config.headers['Content-Type'] = 'application/json;charset=UTF-8'
        }
        config.headers.Authorization ='Bearer '+ window.sessionStorage.getItem('token')//获取token值
        return config
    },
    error => {
        return Promise.reject(error.response)
    })


// 响应拦截器
axios.interceptors.response.use(

    response => {
        switch (response.data.code) {
            case 401:
                // 未授权， token 失效，跳转到登录
                console.log('未授权，请重新登录');
                router.push('/login');
                break;
            // case 403:
            //     // 权限不足，可显示相应提示信息
            //     console.log('权限不足');
            //     break;
            case 404:
                // 资源未找到
                console.log('资源未找到');
                break;
            default:
                return response.data;
                // console.log('请求出错');
        }
        return response.data;
    },
    error => {
        // 这里可以根据错误状态码进行不同的处理
        if (error.response) {
            switch (error.response.status) {
                case 401:
                    // 未授权，可能是 token 失效，可以跳转到登录页面或刷新 token
                    console.log('未授权，请重新登录');
                    break;
                case 403:
                    // 权限不足，可显示相应提示信息
                    console.log('权限不足');
                    break;
                case 404:
                    // 资源未找到
                    console.log('资源未找到');
                    break;
                default:
                    console.log('请求出错');
            }
        } else {
            console.log('网络错误');
        }
        return Promise.reject(error);
    }
);

export default axios
