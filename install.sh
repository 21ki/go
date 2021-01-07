#go 设置代理下载
HTTP_PROXY=http://192.168.10.8:1081

export https_proxy=${HTTP_PROXY}
export http_proxy=${HTTP_PROXY}
git config --global http.proxy "'${HTTP_PROXY}'"
git config --global https.proxy "'${HTTP_PROXY}'"

#取消代理
unset http_proxy
unset https_proxy
git config --global --unset http.proxy
git config --global --unset https.proxy

#下载依赖包
go get -u github.com/gin-gonic/gin

#go gin使用   https://geektutu.com/post/quick-go-gin.html
https://www.infoq.cn/article/iqmyeevziwzgqd2pg2un