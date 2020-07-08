alias g='git'
alias gb='g branch'
alias gbr='gb -r'
alias gbra="gcom; gb | grep -v '${1:-master}' | xargs git branch -D"
alias dasb="for d in ./*/ ; do (cd "$d" && gbra); done"
alias gbd='gb -D'
alias gbdr='g push origin --delete'
alias greset='g reset --hard'
alias gclone='g clone'
alias gitclean='g clean -xdf'
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
