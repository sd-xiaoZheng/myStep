import request from '@/apis/request'

/**
 * bug 爬虫
 */

//爬取页数的内容
export function Crawling(data) {
    return request({
        url: '/WebBug/executeBug?pages='+data,
        method: 'get'
    })
}

//清除数据库
export function KillMysql() {
    return request({
        url: '/WebBug/killMysql',
        method: 'post'
    })
}

//清除数据库
export function getQuestionText(params) {
    return request({
        url: '/WebBug/getQuestionText',
        method: 'get',
        params
    })
}
