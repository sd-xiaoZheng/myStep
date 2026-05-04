import request from '@/apis/request'

/**
 * 添加文章/日记
 * @param formData 表单数据，包含文章信息和文件
 * @returns {*}
 */
export function addArticle(formData) {
    return request({
        url: '/article/addArticle',
        method: 'post',
        data: formData,
        headers: {
            'Content-Type': 'multipart/form-data'
        }
    })
}

/**
 * 更新文章/日记
 * @param data 文章数据
 * @returns {*}
 */
export function updateArticle(data) {
    return request({
        url: '/article/update',
        method: 'post',
        data
    })
}

/**
 * 删除文章/日记
 * @param id 文章ID
 * @returns {*}
 */
export function deleteArticle(id) {
    return request({
        url: `/article/delete/${id}`,
        method: 'delete'
    })
}

/**
 * 获取文章/日记详情
 * @param id 文章ID
 * @returns {*}
 */
export function getArticleById(id) {
    return request({
        url: `/article/detail/${id}`,
        method: 'get'
    })
}

/**
 * 获取筛选条件（天气、标签、心情、类型）
 * @returns {*}
 */
export function getFiltter() {
    return request({
        url: '/article/getFiltter',
        method: 'get'
    })
}

/**
 * 按筛选条件查询文章列表（ES搜索）
 * @param {Object} data - GetArticleVo { startTime, endTime, title, content, keyValueObj }
 * @returns {*}
 */
/**
 * 获取本年活跃度（每月日记数量）
 * @returns {*}
 */
export function getYearlyActivity(params) {
    return request({
        url: '/article/getYearlyActivity',
        method: 'get',
        params
    })
}

export function getArticleByFiltter(data) {
    return request({
        url: '/article/getArticleByFiltter',
        method: 'post',
        data
    })
}
