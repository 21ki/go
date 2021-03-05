#install  1.16 https://sysin.org/article/go-vs-code/
wget https://dl.google.com/go/go1.16.linux-amd64.tar.gz  
tar -zxvf go1.13.linux-amd64.tar.gz -C /usr/local/
mkdir ~/gopath
echo '
export GOROOT=/usr/local/go
export GOPATH=~/gopath
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin
' >> ~/.bashrc
source ~/.bashrc
#换一个国内能访问的代理地址：https://goproxy.cn
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn,direct

#go 命令自动补全
go get -u github.com/posener/complete/gocomplete
# 命令会下载到 $GOPATH/bin 目录下
gocomplete -install

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