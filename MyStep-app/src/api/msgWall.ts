import { http } from '@/http/http'

/**
 * 留言数据类型
 */
export interface IMsgWall {
  id?: number
  leaveFrom: string
  leaveMsg: string
  leaveTime: string
  head: string
}

/**
 * 留言响应类型
 */
export interface IMsgWallRes {
  code: number
  message: string
  data: IMsgWall[]
}

/**
 * 添加留言响应
 */
export interface IAddMsgRes {
  code: number
  message: string
  data?: IMsgWall
}

/**
 * 获取留言列表
 */
export function getMsgList() {
  return http.get<IMsgWall[]>('/msgWall/getmsg')
}

/**
 * 添加留言
 * @param formData 表单数据（包含昵称、留言内容、头像文件）
 */
export function addMsg(formData: FormData) {
  return new Promise<IAddMsgRes>((resolve, reject) => {
    // 获取token
    const token = uni.getStorageSync('token') || ''
    
    uni.uploadFile({
      url: `${import.meta.env.VITE_SERVER_BASEURL}/msgWall/addMsg`,
      filePath: formData.get('avatar') as string,
      name: 'avatar',
      formData: {
        nickname: formData.get('nickname') as string,
        content: formData.get('content') as string,
      },
      header: {
        'Authorization': token ? `Bearer ${token}` : '',
      },
      success: (res) => {
        try {
          const data = JSON.parse(res.data)
          resolve(data as IAddMsgRes)
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
 * 添加留言（仅文本，不上传头像）
 * @param data 留言数据
 */
export function addMsgText(data: { nickname: string; content: string; avatarUrl?: string }) {
  return http.post<IMsgWall>('/msgWall/addMsgText', data)
}
