#!/bin/bash
awsprofile=""
alias vim="nvim"
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
alias portpid='lsof -iTCP -sTCP:LISTEN -n -P'

# ============ security-related stuff ===============================
# zone transfer
function zonetx() {
  for ns in $(dig +short ns "$1"); do dig axfr "$1" @"$ns"; done
}
# Get the Get External IP Address by using opendns resolver
alias myip='dig -4 +short myip.opendns.com @resolver1.opendns.com.'
# Converts a dotted quad x.x.x.x IP to Long IP decimal format for database queries
function ip2long() {
 if [ `echo $1 | tr '.' '\n' | wc -l` != "4" ]; then
  echo "No real ip given"
 else
  echo "$1" | awk -F\. '{print ($4)+($3*256)+($2*256*256)+($1*256*256*256)}'
 fi
}
# Displays the ASN and brief description of the provider for a given IP Address
function ipasn(){
  curl -s https://api.bgpview.io/ip/$1 | jq '.data.prefixes[].asn'
}
# Shows the descriptions for a given ASN
function asndesc(){
  curl -s https://api.bgpview.io/asn/$1/prefixes | jq '.data.ipv4_prefixes[]| {name,description} | map(.) | @csv' | tr -d "\\\\\"" | sed s/","/"           "/ | sort | uniq -c | sort -n
}
# Dumps a list of IPv4 networks allocated to a specific BGP ASN
function asn(){
  curl -s https://api.bgpview.io/asn/$1/prefixes | jq '.data.ipv4_prefixes[].prefix' | tr -d \"
}
