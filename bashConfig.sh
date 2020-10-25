# Reset
Color_Off='\033[0m' # Text Reset

# Regular Colors
Black='\033[0;30m'  # Black
Red='\033[0;31m'    # Red
Green='\033[0;32m'  # Green
Yellow='\033[0;33m' # Yellow
Blue='\033[0;34m'   # Blue
Purple='\033[0;35m' # Purple
Cyan='\033[0;36m'   # Cyan
White='\033[0;37m'  # White

# Bold
BBlack='\033[1;30m'  # Black
BRed='\033[1;31m'    # Red
BGreen='\033[1;32m'  # Green
BYellow='\033[1;33m' # Yellow
BBlue='\033[1;34m'   # Blue
BPurple='\033[1;35m' # Purple
BCyan='\033[1;36m'   # Cyan
BWhite='\033[1;37m'  # White

# Underline
UBlack='\033[4;30m'  # Black
URed='\033[4;31m'    # Red
UGreen='\033[4;32m'  # Green
UYellow='\033[4;33m' # Yellow
UBlue='\033[4;34m'   # Blue
UPurple='\033[4;35m' # Purple
UCyan='\033[4;36m'   # Cyan
UWhite='\033[4;37m'  # White

# Background
On_Black='\033[40m'  # Black
On_Red='\033[41m'    # Red
On_Green='\033[42m'  # Green
On_Yellow='\033[43m' # Yellow
On_Blue='\033[44m'   # Blue
On_Purple='\033[45m' # Purple
On_Cyan='\033[46m'   # Cyan
On_White='\033[47m'  # White

# High Intensity
IBlack='\033[0;90m'  # Black
IRed='\033[0;91m'    # Red
IGreen='\033[0;92m'  # Green
IYellow='\033[0;93m' # Yellow
IBlue='\033[0;94m'   # Blue
IPurple='\033[0;95m' # Purple
ICyan='\033[0;96m'   # Cyan
IWhite='\033[0;97m'  # White

# Bold High Intensity
BIBlack='\033[1;90m'  # Black
BIRed='\033[1;91m'    # Red
BIGreen='\033[1;92m'  # Green
BIYellow='\033[1;93m' # Yellow
BIBlue='\033[1;94m'   # Blue
BIPurple='\033[1;95m' # Purple
BICyan='\033[1;96m'   # Cyan
BIWhite='\033[1;97m'  # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'  # Black
On_IRed='\033[0;101m'    # Red
On_IGreen='\033[0;102m'  # Green
On_IYellow='\033[0;103m' # Yellow
On_IBlue='\033[0;104m'   # Blue
On_IPurple='\033[0;105m' # Purple
On_ICyan='\033[0;106m'   # Cyan
On_IWhite='\033[0;107m'  # White

# ----- EXPORTS -----
export PS1='\
\[\]\n\n\
\['"${BPurple}"'\]@\u\['"${Color_Off}"'\]\
\['"${BCyan}"'\] \T\['"${Color_Off}"'\]\
\['"${BYellow}"'\] \w\['"${Color_Off}"'\]\
\['"${BGreen}"'\]`__git_ps1`\['"${Color_Off}"'\]\
\[\]\n\
\['"${BWhite}"'\]➤➤➤ \['"${Color_Off}"'\]\
\[\]'

export EDITOR='npp -w'
export HISTTIMEFORMAT='%b %d %I:%M %p ' # using strftimr format
export HISTCONTROL=ignoreboth           # ignoredups:ignorespace
export HISTIGNORE="history:pwd:exit:df:ls:ls -la:ll:l:c:x:d:h:bc:cd:src:"

# ----- SHORTCUTS ------
alias count='find . -type f | wc -l'
alias lt='ls --human-readable --size -1 -S --classify'
alias x='exit'
alias get='time ll -R | grep '
alias ~='cd ~ && .'
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
alias git_bash='${BASH_PATH}/git-bash.exe'
alias k='kill'
alias echo='echo -e'
alias src='source ~/.bash_profile'
alias bashrc='npp ~/.bashrc'
alias vh='vagrant halt'
alias vd='vagrant destroy'
alias git_bash='${BASH_PATH}/git-bash.exe'
alias config='cd H:/Desktop/Git/config && explorer .'
alias d='cd H:/Desktop/'

dup() { cat -n $1 | sort -k2 -k1n | uniq -f1 -cd; }

kill() {
  for pid_name in "$@"; do
    taskkill -f -im "${pid_name}.exe" -t
  done
}

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

# ------ PROGRAMMING -----

jrun() {
  javac $1.java && java $1 && rm $1.class
}

alias .run='dotnet run'
alias .build='dotnet build'
alias .clean='dotnet clean'
alias .restore='dotnet restore'
alias .test='dotnet test'
alias .init='dotnet new console && dotnet restore'
alias .console='dotnet new console'
alias .watch_build='dotnet watch build'
alias .watch_test='dotnet watch test'
alias .debugon='export VSTEST_HOST_DEBUG=1'
alias .debugoff='export VSTEST_HOST_DEBUG=0'

.testp() { .test --filter Priority=${1:-1} --logger:"console;verbosity=detailed"; }
.testm() { .test --filter Name~$1 --logger:"console;verbosity=detailed"; }
.testc() { .test --filter ClassName~$1 --logger:"console;verbosity=detailed"; }
.test_except_this() { .test --filter ClassName!~$1; }
.watch_testc() { .watch_test --filter ClassName~$1; }

.debug_test() {
  .debugon
  .testm $1
  .debugoff
}

.coverage() {
  repo=$(${1:-PWD})
  .kill
  dotnet test ${repo} \
  -p:CollectCoverage=true \
  -p:CoverletOutputFormat=\"json,opencover,lcov\" \
  -p:CoverletOutput="${repo}/" \
  -p:ExcludeByAttribute=\"Obsolete,GeneratedCodeAttribute,CompilerGeneratedAttribute\" ||
    die "Failed to run dotnet test"
}

.ref_add_to_sln() { dotnet sln add $1; }
.ref_rm_from_sln() { dotnet sln remove $1; }
.ref_add() { dotnet add reference $1; }
.kill() { kill dotnet; }

cpp() { g++ $1.cpp -o $1 && ./$1; }
cc() { g++ $1.cc -o $1 && ./$1; }

TRUST="--trusted-host pypi.org --trusted-host files.pythonhosted.org"

# ----- GIT -----
alias g='git'
alias gb='g branch'
alias gbr='gb -r'
alias dasb="for d in ./*/ ; do (cd "$d" && gbra); done"
alias gbd='gb -D'
alias gbdr='g push origin --delete'
alias greset='g reset --hard'
alias gclone='g clone'
alias gitclean='g clean -xdf -e .vagrant'
alias gsta='g stash'
alias gstaa='g stash apply'
alias gf='g fetch'
alias gpl='g pull'
alias gp='g push'
alias gd='g diff'
alias gm='g merge'
alias gc='g commit -m'
alias gcm='g commit'
alias ga='g add'
alias gac='g commit -am'
alias gaa='g add .'
alias gs='g status'
alias gsh='g show'
alias gco='g checkout'
alias gcom='g checkout master'
alias gmpl='gco master && gpl'
alias gmm='gm master'
alias gma='gm --abort'
alias gcob='g checkout -b'
alias grm='g rm'
alias gsw='g switch -'
alias ab='echo -e "\n***$(__git_ps1) ***"'
alias gchmod='g update-index --chmod=+x'
alias gl='g log -10 --pretty=format:"%h | %<(25)%an | %<(15)%ar | %s"'
alias gdal='gcom && gb | grep -v "master" | xargs g branch -D '
alias glc='g log --stat --pretty="%C(Yellow)=====================================================================%n%h | %C(magenta)%an%Creset | %ad | %ar %n%n %B" --graph'

gbd_all() { gbd $1 && gbdr $1; }
gacp() { gaa && gc "$1" && gp; }
glg() { glc --grep=$1; }
gcp() { gc "$1" && gp; }

mm() {
  gco ${1:-master}
  gpl
  gco -
  gm ${1:-master}
}

find_replace() {
  sed -i "s/${1}/${2}/" ${3}
}

highlight() {
  echo "${Black}${On_Cyan} $@ ${Color_Off}"
}

draw_line() {
  echo "${BCyan}.................................... ${1:-.} ...................................${Color_Off}"
}

highlight_with_date() {
  if [ $# -eq 0 ]; then
    echo "================ $(date --utc --iso-8601=sec) ================"
  else
    color=$1
    shift 1
    echo "$color================ $@ $(date --utc --iso-8601=sec) ================${Color_Off}"
  fi
}

error_msg() {
  echo "\n${BRed}ERROR: $*${Color_Off}" >&2
}
