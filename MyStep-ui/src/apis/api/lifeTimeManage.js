import request from '@/apis/request'

/**
 * 照片类型
 */

// 添加照片类型
export function addPhotoType(data) {
    // 假设这里需要将 data 里的字段转换为驼峰命名
    // 简单示例：如果 data 是一个对象，将其键转换为驼峰命名
    return request({
        data: data,
        url: '/photoType/addPhotoType',
        method: 'post',
        headers: {
            'Content-Type': 'multipart/form-data'
        }
    })
}

// 添加照片
export function addPhoto(data) {
    // 假设这里需要将 data 里的字段转换为驼峰命名
    // 简单示例：如果 data 是一个对象，将其键转换为驼峰命名
    return request({
        data: data,
        url: '/photoType/addPhoto',
        method: 'post',
        headers: {
            'Content-Type': 'multipart/form-data'
        }
    })
}

// 修改留言
export function editPhotoType(data) {
    // 假设这里需要将 data 里的字段转换为驼峰命名
    // 简单示例：如果 data 是一个对象，将其键转换为驼峰命名
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

