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

/**
 * 更新日记
 * @param data 日记数据
 * @returns {*}
 */
export function updateDiary(data) {
  // 如果data已经是FormData，直接使用
  if (data instanceof FormData) {
    return request({
      url: '/article/updateArticle',
      method: 'post',
      data: data,
      headers: {
        'Content-Type': 'multipart/form-data'
      }
    })
  }

  // 否则创建新的FormData
  const formData = new FormData();

  // 添加普通字段
  Object.keys(data).forEach(key => {
    if (key !== 'images' && key !== 'tagIds') {
      if (data[key] !== null && data[key] !== undefined) {
        formData.append(key, data[key]);
      }
    }
  });

  // 添加图片文件
  if (data.images && data.images.length > 0) {
    for (let i = 0; i < data.images.length; i++) {
      formData.append('images', data.images[i]);
    }
  }

  // 添加标签ID数组
  if (data.tagIds && data.tagIds.length > 0) {
    data.tagIds.forEach(tagId => {
      formData.append('tagIds', tagId);
    });
  }

  // 添加updateFile数组
  if (data.updateFile && data.updateFile.length > 0) {
    data.updateFile.forEach(updateFileItem => {
      formData.append('updateFile', JSON.stringify(updateFileItem));
    });
  }

  return request({
    url: '/step/article/updateArticle',
    method: 'post',
    data: formData,
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  })
}
