import request from '@/apis/request'

/**
 * bug 爬虫
 */

//购买
export function purchase(data) {
    return request({
        url: '/create',
        method: 'post',
        data
    })
}
