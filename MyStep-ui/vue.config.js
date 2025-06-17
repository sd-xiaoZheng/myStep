//前端解决跨域问题
module.exports = {
    devServer: {
        sockHost: 'http://localhost:18888/step',//不加这个总是控制台报错，没影响但是看着难受
        // 端口号
        port: 8080,
        // 配置不同的后台API地址 http://localhost:18888/step
        proxy: {
            '/api': {
                target: 'http://localhost:18888/step',
                ws: false,
                changeOrigin: true,
                pathRewrite: {
                    '^/api': ''//如果想删除请求路径中的/step应该可以写在这里
                }
            }
        }
    }
}