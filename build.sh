#!/bin/bash

set -eux

GOOS=linux
CGO_ENABLED=0

go mod verify
go test ./...
go build --ldflags="-X pkg.version=$(git describe --dirty)"
