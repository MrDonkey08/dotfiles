# cat
alias bat='bat --color=always'

# dates
alias iso_date='date +"%Y-%m-%d"'
alias us_date='iso_date'
alias cdate='iso_date'
alias mxn_date='date +"%d-%m-%Y"'

# alias to get tempeature of the cpu cores
alias core-temp='sensors | grep Core'

# comands/alias to get public ip
# alias pub-ip='curl https://ipinfo.io/ip'
alias pub-ip='curl ifconfig.me'
alias pub-ipv4='curl -4 ifconfig.me'
alias pub-ipv6='curl -6 ifconfig.me'
alias pub-ip-json='curl -4 ipinfo.io/json'
alias pub-ipv4-json='curl -4 ipinfo.io/json'
alias pub-ipv6-json='curl -6 ipinfo.io/json'

# GUI apps aliases
alias filen='setsid filen &> /dev/null &'
alias session='setsid session &> /dev/null &'
alias onlyoffice='setsid onlyoffice &> /dev/null &'
alias standard-notes='setsid standard-notes &> /dev/null &'

# grep
alias grep='grep --color=auto'
alias egrep='grep -E --color=auto'
alias fgrep='grep -F --color=auto'
alias grepp='grep -P --color=auto'

# Git
alias gitclean="find . -type d -name '.git' -execdir git clean -dfx \;"
