import request from '@/apis/request'

/**
 * 获取类型列表
 * @param params 查询参数
 * @returns {*}
 */
export function getTypeList(params) {
    return request({
        url: '/type/list',
        method: 'get',
        params
    })
}

/**
 * 添加类型
 * @param data 类型数据
 * @returns {*}
 */
export function addType(data) {
    return request({
        url: '/type/add',
        method: 'post',
        data
    })
}

/**
 * 更新类型
 * @param data 类型数据
 * @returns {*}
 */
export function updateType(data) {
    return request({
        url: '/type/update',
        method: 'put',
        data
    })
}

/**
 * 删除类型
 * @param id 类型ID
 * @returns {*}
 */
export function deleteType(id) {
    return request({
        url: `/type/delete/${id}`,
        method: 'delete'
    })
}