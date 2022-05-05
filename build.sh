#!/bin/bash
set -eux

ARCH=$(lscpu | grep Architecture | awk '{print $2}')
PLATFORM=$(if [ "$ARCH" = "aarch64" ]; then echo "arm64"; else echo "amd64"; fi)
GOOS=linux 
GOARCH=$PLATFORM 
#CGO_ENABLED=0 go build

#GOOS=linux GOARCH=$PLATFORM CGO_ENABLED=0 go build --ldflags="-X pkg.version=$(git describe --dirty)"
go mod verify 
go test ./...
# go build --ldflags="-X pkg.version=$(git describe --dirty)"
go build
