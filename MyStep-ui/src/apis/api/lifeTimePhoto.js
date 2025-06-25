import request from '@/apis/request'

// 获取类型
export function getPhoto(params) {
    return request({
        url: '/photo/getPhoto',
        method: 'get',
        params
    })
}

