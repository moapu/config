alias get='time ll -R | grep '
alias ~='cd ~ && .'
alias count='find . -type f | wc -l'
alias lt='ls --human-readable --size -1 -S --classify'
alias x='exit'
alias grepr='grep -Enr --color=auto'
alias grep='grep -E --color=auto'
alias sed='sed -E'
alias lgrep='l | grep '
alias agrep='alias | grep '
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
alias cd.='cd ..'
alias cd..='cd ../..'
alias cd...='cd ../../..'
alias cd....='cd ../../../..'
alias ,='code .'
alias k='kill'
alias echo='echo -e'
alias src='source ~/.bash_profile'
alias bashrc='npp ~/.bashrc'
alias vu='vagrant up'
alias vssh='vagrant ssh'
alias vh='vagrant halt'
alias vd='vagrant destroy'
alias vr='vagrant reload'
alias vrp='vagrant reload --provision'

title() { TITLEPREFIX=$1; }
kill_dotnet_node() { kill dotnet node; }
kill_bash() { kill conhost bash; }
dup() { cat -n $1 | sort -k2 -k1n | uniq -f1 -cd; }

b() {
  i=1
  re='^[2-9]$'

  if [[ $# == 0 ]] || [[ $1 = 1 ]]; then
    git_bash &
    disown

  elif [[ $1 =~ $re ]]; then

    until [ $i -gt $1 ]; do
      git_bash &
      disown
      ((i = i + 1))
    done

  else
    error_msg "MUST be 1..9"
  fi
}

dup() { cat -n $1 | sort -k2 -k1n | uniq -f1 -cd; }
