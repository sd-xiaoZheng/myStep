import request from '@/apis/request'

/**
 * 获取心情列表
 * @param params 查询参数
 * @returns {*}
 */
export function getMoodList(params) {
    return request({
        url: '/mood/list',
        method: 'get',
        params
    })
}

/**
 * 添加心情
 * @param data 心情数据
 * @returns {*}
 */
export function addMood(data) {
    return request({
        url: '/mood/add',
        method: 'post',
        data: data
    })
}

/**
 * 更新心情
 * @param data 心情数据
 * @returns {*}
 */
export function updateMood(data) {
    return request({
        url: '/mood/update',
        method: 'post',
        data: data
    })
}

/**
 * 删除心情
 * @param id 心情ID
 * @returns {*}
 */
export function deleteMood(id) {
    return request({
        url: `/mood/delete/${id}`,
        method: 'delete'
    })
}