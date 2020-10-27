#!/bin/bash
awsprofile=""
alias vim="nvim"
alias myip='dig -4 +short myip.opendns.com @resolver1.opendns.com.'
totrash(){ rrr="${1}"; s=$(echo 'tell application "Finder" to move POSIX file "'$(pwd)/${rrr}'" to trash'); osascript -e "${s}"; }
function golinux() {
	CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o $1 .
}
alias k8s-ls='aws eks list-clusters --profile $awsprofile'
alias akcfg='aws eks update-kubeconfig --profile $awsprofile'
alias apy='AWS_PROFILE=$awsprofile python'
alias kgp='kubectl get pods'
alias kgd='kubectl get deployments'
alias kgn='kubectl get nodes'
alias klog='kubectl logs'
alias git-update='for d in `ls`; do cd $d && git pull && cd ..; done'
alias knodes='kubectl get nodes --no-headers | awk '\''{print $1}'\'' | xargs -I {} sh -c '\''echo {} ; kubectl describe node {} | grep Allocated -A 5 | grep -ve Event -ve Allocated -ve percent -ve -- ; echo '\'''
alias lambdagen='pip install -r requirements.txt --target ./package'
alias lambdadeploy='rm -f function.zip && cd package && zip -r9 ../function.zip . && cd .. && zip -g function.zip lambda_function.py && aws lambda update-function-code --zip-file fileb://function.zip --function-name'
