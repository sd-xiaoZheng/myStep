import request from '@/apis/request'

// 获取类型
export function getPhoto(params) {
    return request({
        url: '/photo/getPhoto',
        method: 'get',
        params
    })
}


// 更新照片
export function updatePhoto(data) {
    return request({
        data,
        url: '/photo/updatePhoto',
        method: 'post',
        headers: {
            'Content-Type': 'multipart/form-data'
        }
    })
}