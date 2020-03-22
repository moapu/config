alias count='find . -type f | wc -l'
alias lt='ls --human-readable --size -1 -S --classify'
alias x='exit'
alias get='time ll -R | grep '
alias ~='cd ~ && .'
alias grep='grep -Enr --color=auto'
alias lgrep='l | grep '
alias agrep='alias | grep '
alias sed='sed -E'
alias ll='ls --color=auto -ltrahG'
alias ls='ls --color=auto'
alias l='ls --color=auto *'
alias h='history'
alias mv='mv -i'
alias df='df -h'
alias du='du -h'
alias rmdir='rm -rf'
alias untar='tar -zxvf '
alias c='clear'
alias .='explorer .'
alias cd.='cd ..'
alias cd..='cd ../..'
alias cd...='cd ../../..'
alias cd....='cd ../../../..'
alias ,='code .'

title () { TITLEPREFIX=$1; }

kill () {
	for var in "$@"
	do
		python H:/Desktop/Git/config/kill.py "${var}.exe" ;
	done
}

dup() { cat -n $1 | sort -k2 -k1n | uniq -f1 -cd; }