export MY_PROGRAMS="/c/Program\ Files"

# -------- COLORS -------
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

# -------- Exports -------
export HISTTIMEFORMAT='%b %d %I:%M %p ' # using strftimr format
export EDITOR="${MY_PROGRAMS}/VSCode/Code -w"
export HISTCONTROL=ignoreboth # ignoredups:ignorespace
export HISTIGNORE="pwd:df:ls:ll:l:c:x:d:h:bc:cd:src:"

# -------- general shortcut ----------
alias count='find . -type f | wc -l'
alias find-file='find . -print | grep '
alias lt='ls --human-readable --size -1 -S --classify'
alias x='exit'
alias get='time ll -R | grep '
alias ~='cd ~ && .'
alias grepr='grep -Enr --color=auto'
alias grep='grep --color=auto'
alias sed='sed -E'
alias lgrep='l | grep '
alias agrep='alias | grep '
alias hgrep='history | grep '
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
alias npp="start ${MY_PROGRAMS}/Notepad++/notepad++.exe"
alias git_bash="${MY_PROGRAMS}/Git/git-bash.exe"
alias k='kill'
alias echo='echo -e'
alias config='cd ~/Desktop/config/bash_config/ && ,'
alias src='source ~/.bash_profile'
alias bashrc='npp ~/.bashrc'
alias kb="${MY_PROGRAMS}/kubectl/kubectl"
alias mkb="${MY_PROGRAMS}/kubectl/minikube"
alias vh="vagrant halt"
alias vu="vagrant up"
alias vr="vagrant reload"
alias vrp="vagrant reload --provision"
alias vd="vagrant destroy"
alias vssh="vagrant ssh"

tar-gz() {
	show_command tar -czvf test.tar.gz $@
}

pull_if_branch_is() {
	is_master=$(git rev-parse --abbrev-ref HEAD | grep ${1})
	if [[ "${is_master}" ]]; then
		git pull
	else
		error_msg "NOT '$1' branch"
	fi
}

dup() {
	show_command cat -n $1 | sort -k2 -k1n | uniq -f1 -cd
}

unique() {
	show_command dup ${2} | grep "${1}"
}

del-dup-keep-1st-instance() {
	show_command cat -n $1 | sort -uk2 | sort -nk1 | cut -f2- >${2:-refined}.txt 2>&1
}

kill() {
	for pid_name in "$@"; do
		show_command taskkill -f -im "${pid_name}.exe" -t
	done
}

export DEBUG_MODE=0
_() {
	if [[ $DEBUG_MODE == 0 ]]; then
		set -x
		DEBUG_MODE=1
	else
		set +x
		DEBUG_MODE=0
	fi
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

utc() {
	if [ $# -eq 0 ]; then
		show_command date -d "+4 Hours" +'%Y-%m-%dT%H:%M:%SZ'
	else
		show_command date -d "+4 Hours ${1} Minutes" +'%Y-%m-%dT%H:%M:%SZ'
	fi
}

rename-tab() {
	show_command ConEmuC -GuiMacro Rename 0 "${1}"
}

rename_file_extensions() {
	for f in *.${1}; do
		show_command mv -- "$f" "${f%.$1}.$2"
	done
}

find_replace() {
	sed -i "s/${1}/${2}/" ${3}
}

# alias wait_for_user_to_press_enter_and_exit="printf '\n\n=== PRESS [Enter] To EXIT ==='; read -p "."; exit"

# start in a git bash instance and run a command from there
# git_bash -lic "client; wait_for_user_to_press_enter_and_exit" &

highlight() {
	echo "${Black}${On_Cyan} $@ ${Color_Off}"
}

prompt() {
	echo "\t${Black}${On_Red} $@ ${Color_Off}"
}

show_command() {
	prompt $@
	"$@"
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

# --------- Programming --------

# display when testing
# the following goes in a gradle file

#test {
#    testLogging {
#        events "passed", "failed", "standardOut", "standardError"
#    }
#}

# tasks.withType(JavaExec) {
#    if (System.getProperty('DEBUG', 'false') == 'true') {
#        jvmArgs '-Xdebug', '-Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005'
#    }
#}

# gradle test --debug-jvm

# Java
alias gradle='./gradlew'

jrun() {
	name=$1

	if [[ "$name" =~ \.java$ ]]; then
		name=${name::-5}

	elif [[ "$name" =~ \.class$ ]]; then
		name=${name::-6}

	elif [[ "$name" =~ \.$ ]]; then
		name=${name::-1}
	fi

	javac "${name}.java"
	java $name
}

# C#
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
alias .nuget-local-clear='dotnet nuget locals all --clear'

alias .r='.run'
alias .b='.build'
alias .c='.clean'
alias .t='.test'

.testp() { .test --filter Priority=${1:-1} --logger:"console;verbosity=detailed"; }
.testm() { .test --filter Name~$1 --logger:"console;verbosity=detailed"; }
.testc() { .test --filter ClassName~$1 --logger:"console;verbosity=detailed"; }
.test_except_this() { .test --filter ClassName!~$1; }
.watch_testc() { .watch_test --filter ClassName~$1; }

.tests() {
	if [ $# -eq 0 ]; then
		.test | grep "Passed!  - Failed:"
	else
		.test $1 | grep "Passed!  - Failed:"
	fi
}

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
.k() { kill dotnet; }

# C++
# cpp() { g++ $1.cpp -o $1 && ./$1; }
# cc() { g++ $1.cc -o $1 && ./$1; }

# python
TRUST="--trusted-host pypi.org --trusted-host files.pythonhosted.org"

# --------- db ----------
alias dump='flush'
alias rap='redis; amq; pg'
alias ra='redis; amq'

flush() {
	local result=$(redis-cli flushdb)
	if [[ $result == "OK" ]]; then
		highlight "REDIS FLUSHED"
	fi
}

pgdump_sql() {
	table_name=${1}
	db_name=${2}
	pg_dump -U postgres --data-only --table=${table_name} --file=${3:-new_sql}.sql ${db_name}
}

export REDIS_PORT=6379
rm_redis_key() {
	local keys=$(redis-cli -p ${REDIS_PORT} KEYS "*${1}*")

	if [[ -n "$keys" ]]; then
		for key in ${keys[@]}; do
			local result=$(echo "redis-cli -p ${REDIS_PORT} DEL ${key}" | bash)
			if [[ $result == "1" ]]; then
				echo "REMOVED | $key"
			fi
		done
	else
		error_msg "REDIS KEYS NOT FOUND"
	fi
}

# --------- Git ----------
alias gb='git branch'
alias gbr='gb -r'
alias gbdr='git push origin --delete'
alias greset='git reset --hard'
alias gclone='git clone'
alias gclean='git clean -xdf -e .vagrant -e .build -e *.log'
alias gsta='git stash'
alias gstaa='git stash apply'
alias gpl='git pull'
alias gp='git push'
alias gd='git diff'
alias gm='git merge'
alias gc='git commit -m'
alias gcm='git commit'
alias ga='git add'
alias gac='git commit -am'
alias gaa='git add .'
alias gs='git status'
alias gsh='git show'
alias gco='git checkout'
alias gma='gm --abort'
alias gcob='git checkout -b'
alias grestore='git restore --staged'
alias grm='git rm'
alias gsw='git switch -'
alias ab='echo -e "\n***$(__git_ps1) ***"'
alias gchmod='git update-index --chmod=+x'
alias gl='git log -10 --pretty=format:"%h | %<(25)%an | %<(15)%ar | %s"'
alias glc='git log --stat --pretty="%C(Yellow)=====================================================================%n%h | %C(magenta)%an%Creset | %ad | %ar %n%n %B" --graph'

get_master_branch() {
	local BRANCH="master"

	if [[ $(git branch | grep "activeSprint") ]]; then
		BRANCH="activeSprint"

	elif [[ $(git branch | grep "main") ]]; then
		BRANCH="main"
	fi

	# same as returning a value
	echo "$BRANCH"
}

gcom() {
	local branch=$(get_master_branch)
	show_command git checkout $branch
}

gbra() {
	local branch=$(get_master_branch)
	show_command git checkout $branch
	show_command git branch | grep -v "${branch}" | xargs git branch -D
}

gacp() { gaa && gc "$1" && gp; }
glg() { glc --grep=$1; }
gcp() { gc "$1" && gp; }

mm() {
	if [[ "${1}" ]]; then
		merge_branch "${1}"

	else
		local branch=$(get_master_branch)
		merge_branch "$branch"
	fi
}

merge_branch() {
	show_command git checkout ${1}
	show_command git pull origin ${1}
	show_command git checkout -
	show_command git merge ${1}
}

export PS1='\
\[\]\n\n\
\['"${BPurple}"'\]@\u\['"${Color_Off}"'\]\
\['"${BCyan}"'\] [\T]\['"${Color_Off}"'\]\
\['"${BYellow}"'\] \w\['"${Color_Off}"'\]\
\['"${BGreen}"'\]`__git_ps1`\['"${Color_Off}"'\]\
\[\]\n\
\['"${BWhite}"'\]$ \['"${Color_Off}"'\]\
\[\]'

trap 'prompt "# $BASH_COMMAND"' DEBUG
