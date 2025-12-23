import request from '@/apis/request'

/**
 * 获取日记列表
 * @param params 查询参数
 * @returns {*}
 */
export function getDiaryList(params) {
    return request({
        url: '/article/getDairy',
        method: 'get',
        params
    })
}
