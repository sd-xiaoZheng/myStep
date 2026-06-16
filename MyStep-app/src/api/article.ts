/**
 * 文章/代办 接口定义
 */
import { http } from '@/http/http'
import type { IResponse } from '@/http/types'

/**
 * 添加文章响应
 */
export interface IAddArticleRes {
  code: number
  msg: string
}

/**
 * 代办提交数据
 */
export interface ITodoData {
  /** 文章内容 */
  content: string
  /** 写作时间 (格式: yyyy-MM-dd HH:mm:ss) */
  writeTime: string
  /** 写作者名称 */
  authorName: string
  /** 写作者ID */
  authorId: number
  /** 是否星标（重要代办） */
  isStar: boolean
}

/**
 * 对象转 queryString
 */
function toQueryString(data: Record<string, any>): string {
  return Object.entries(data)
    .filter(([_, v]) => v !== undefined && v !== null)
    .map(([k, v]) => `${encodeURIComponent(k)}=${encodeURIComponent(v)}`)
    .join('&')
}

/**
 * 获取基础请求URL
 */
function getBaseUrl() {
  return import.meta.env.VITE_SERVER_BASEURL
}

/**
 * 添加代办（调用 /step/article/addArticle，typeId 强制为 8）
 * 后端使用 @ModelAttribute 接收，这里用 form-urlencoded 方式提交
 */
export function addTodo(data: ITodoData): Promise<IAddArticleRes> {
  return new Promise<IAddArticleRes>((resolve, reject) => {
    const token = uni.getStorageSync('token') || ''

    uni.request({
      url: `${getBaseUrl()}/step/article/addArticle`,
      method: 'POST',
      header: {
        'Authorization': token ? `Bearer ${token}` : '',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      data: toQueryString({
        typeId: 8,
        ...data,
      }),
      success: (res) => {
        try {
          resolve(res.data as IAddArticleRes)
        } catch (e) {
          reject(e)
        }
      },
      fail: (err) => {
        reject(err)
      },
    })
  })
}

/**
 * 添加文章（带图片，使用 multipart 上传）
 * @param formData 包含文章字段及图片文件的 FormData
 */
export function addArticle(formData: Record<string, any>, imagePaths?: string[]): Promise<IAddArticleRes> {
  return new Promise<IAddArticleRes>((resolve, reject) => {
    const token = uni.getStorageSync('token') || ''

    // 有图片时使用 uploadFile，否则使用普通 request
    if (imagePaths && imagePaths.length > 0) {
      uni.uploadFile({
        url: `${getBaseUrl()}/step/article/addArticle`,
        filePath: imagePaths[0],
        name: 'images',
        formData: formData,
        header: {
          'Authorization': token ? `Bearer ${token}` : '',
        },
        success: (res) => {
          try {
            resolve(JSON.parse(res.data) as IAddArticleRes)
          } catch (e) {
            reject(e)
          }
        },
        fail: (err) => {
          reject(err)
        },
      })
    } else {
      uni.request({
        url: `${getBaseUrl()}/step/article/addArticle`,
        method: 'POST',
        header: {
          'Authorization': token ? `Bearer ${token}` : '',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        data: toQueryString(formData),
        success: (res) => {
          try {
            resolve(res.data as IAddArticleRes)
          } catch (e) {
            reject(e)
          }
        },
        fail: (err) => {
          reject(err)
        },
      })
    }
  })
}
