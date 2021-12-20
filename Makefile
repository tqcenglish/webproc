buildDateTime = $(shell date '+%Y-%m-%d %H:%M:%S')
gitCommitCode = $(shell git rev-list --full-history --all --abbrev-commit --max-count 1)
goVersion = $(shell go version)

build:
	go build -o ./deployments/webproc ./cmd/main.go

release:
	GOOS=linux GOARCH=amd64 go build  -o ./deployments/webproc ./cmd/main.go
	upx -9 --lzma ./deployments/webproc