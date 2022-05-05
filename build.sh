#!/bin/bash
set -eux

export CGO_ENABLED=0
export GOBIN=/conntrack-stats-exporter
export GOOS=linux


if [ "$(lscpu | grep Architecture | awk '{print $2}')" = "aarch64" ]; then 
    echo "arm64"
    export GOARCH=arm64
else 
    echo "amd64"
    export GOARCH=arm64
fi

go mod verify 
go test ./...
go build

# go build --ldflags="-X pkg.version=$(git describe --dirty)"
