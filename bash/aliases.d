#!/bin/bash
alias vim="nvim"
alias myip='dig -4 +short myip.opendns.com @resolver1.opendns.com.'
totrash(){ rrr="${1}"; s=$(echo 'tell application "Finder" to move POSIX file "'$(pwd)/${rrr}'" to trash'); osascript -e "${s}"; }
function golinux() {
	CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o $1 .
}
