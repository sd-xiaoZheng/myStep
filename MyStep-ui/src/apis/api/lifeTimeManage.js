import request from '@/apis/request'

/**
 * 照片类型
 */

// 添加照片类型
export function addPhotoType(data) {
    return request({
        data: data,
        url: '/photoType/addPhotoType',
        method: 'post',
        headers: {
            'Content-Type': 'multipart/form-data'
        }
    })
}


// 批量添加照片
export function addPhotoBatch(data) {
    return request({
        data: data,
        url: '/photoType/addPhotoBatch',
        method: 'post',
        headers: {
            'Content-Type': 'multipart/form-data'
        }
    })
}

// 修改类型
export function editPhotoType(data) {
    return request({
        data: data,
        url: '/photoType/editPhotoType',
        method: 'post',
        headers: {
            'Content-Type': 'multipart/form-data'
        }
    })
}

// 获取类型和短语
export function getPhotoTypeAndPhrase(params) {
    return request({
        url: '/photoType/getPhotoTypeAndPhrase',
        method: 'get',
        params
    })
}

// 获取类型
export function getPhotoTypeList(params) {
    return request({
        url: '/photoType/getPhotoType',
        method: 'get',
        params
    })
}

// 删除类型
export function deletePhotoTypeList(data) {
    return request({
        data: data,
        url: '/photoType/deletePhotoType',
        method: 'DELETE',
    })
}

