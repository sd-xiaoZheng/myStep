import request from '@/apis/request'

/**
 * 留言墙
 */

//添加留言
export function addMsg(data) {
    return request({
        data,
        url: '/msgWall/addMsg',
        method: 'post',
        headers: {
            'Content-Type': 'multipart/form-data'
        }
    })
}
//添加查询
export function getMsg() {
    return request({
        url: '/msgWall/getmsg',
        method: 'get'
    })
}