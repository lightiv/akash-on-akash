ulimit -n 65530

export GOPATH=/usr/local/go
export GOROOT=$GOPATH
export GOBIN=$GOPATH/bin

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:~/bin:/root/.local/bin:$GOROOT/bin:$GOPATH/bin:$GOBIN:$PATH"
