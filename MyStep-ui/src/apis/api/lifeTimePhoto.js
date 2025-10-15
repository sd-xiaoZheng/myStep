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

// 收藏照片
export function likePhoto(data) {
    return request({
        data,
        url: '/photo/likePhoto',
        method: 'post'
    })
}

// 取消收藏照片
export function UnLikePhoto(data) {
    return request({
        data,
        url: '/photo/UnLikePhoto',
        method: 'post'
    })
}

// 删除照片（按需携带 id 与 typeId）
export function deletePhoto(data) {
    return request({
        data,
        url: '/photo/deletePhoto',
        method: 'post'
    })
}