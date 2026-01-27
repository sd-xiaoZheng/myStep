import request from '@/apis/request'

/**
 * 获取标签列表
 * @param params 查询参数
 * @returns {*}
 */
export function getTagList(params) {
    return request({
        url: '/tag/list',
        method: 'get',
        params
    })
}

/**
 * 添加标签
 * @param data 标签数据
 * @returns {*}
 */
export function addTag(data) {
    return request({
        url: '/tag/add',
        method: 'post',
        data
    })
}

/**
 * 更新标签
 * @param data 标签数据
 * @returns {*}
 */
export function updateTag(data) {
    return request({
        url: '/tag/update',
        method: 'post',
        data
    })
}

/**
 * 删除标签
 * @param id 标签ID
 * @returns {*}
 */
export function deleteTag(id) {
    return request({
        url: `/tag/delete/${id}`,
        method: 'delete'
    })
}