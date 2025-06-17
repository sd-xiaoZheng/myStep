// 权限管理API  【菜单、角色、权限】
import request from '@/apis/request'

/**
 * 登录
 */
export function login(data) {
    return request({
        url: '/login',
        method: 'post',
        data
    })
}

/**
 * 注册
 */
export function register(data) {
    return request({
        url: '/register',
        method: 'post',
        data
    })
}
/**
 * 请求验证码
 */
export function sendCodeEmail(data) {
    return request({
        url: '/sendCodeEmail',
        method: 'post',
        data
    })
}

/**
 * 登出
 */
export function logout() {
    return request({
        url: '/logout',
        method: 'post'
    })
}