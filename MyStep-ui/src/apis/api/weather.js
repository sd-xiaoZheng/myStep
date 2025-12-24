import request from '@/apis/request'

/**
 * 获取天气列表
 * @param params 查询参数
 * @returns {*}
 */
export function getWeatherList(params) {
    return request({
        url: '/weather/list',
        method: 'get',
        params
    })
}

/**
 * 添加天气
 * @param data 天气数据
 * @returns {*}
 */
export function addWeather(data) {
    return request({
        url: '/weather/add',
        method: 'post',
        data: data
    })
}

/**
 * 更新天气
 * @param data 天气数据
 * @returns {*}
 */
export function updateWeather(data) {
    return request({
        url: '/weather/update',
        method: 'post',
        data: data
    })
}

/**
 * 删除天气
 * @param id 天气ID
 * @returns {*}
 */
export function deleteWeather(id) {
    return request({
        url: `/weather/delete/${id}`,
        method: 'delete'
    })
}