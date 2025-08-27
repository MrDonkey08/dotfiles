# cat
alias bat='bat --color=always'

# dates
alias iso_date='date +"%Y-%m-%d"'
alias us_date='iso_date'
alias cdate='iso_date'
alias mxn_date='date +"%d-%m-%Y"'

# grep
alias grep='grep --color=auto'
alias egrep='grep -E --color=auto'
alias fgrep='grep -F --color=auto'
alias grepp='grep -P --color=auto'

# Git
alias gitclean="find . -type d -name '.git' -execdir git clean -dfx \;"
