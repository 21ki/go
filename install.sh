#go 设置代理下载
export https_proxy=http://127.0.0.1:8118
export http_proxy=http://127.0.0.1:8118
git config --global http.proxy 'http://127.0.0.1:8118'
git config --global https.proxy 'http://127.0.0.1:8118'


#取消代理
unset http_proxy
unset https_proxy
git config --global --unset http.proxy
git config --global --unset https.proxy

#下载依赖包
go get -u github.com/gin-gonic/gin

#go gin使用   https://geektutu.com/post/quick-go-gin.html
https://www.infoq.cn/article/iqmyeevziwzgqd2pg2un