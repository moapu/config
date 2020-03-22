alias g='git'
alias gb='git branch'
alias gbr='gb -r'
alias gbd='gb -D'
alias gbdr='git push origin --delete'
alias greset='git reset --hard'
alias gclone='git clone'
alias gitclean='git clean -xdf'
alias gsta='git stash'
alias gstaa='git stash apply'
alias gf='git fetch'
alias gpl='git pull'
alias gp='git push'
alias gd='git diff'
alias gm='git merge'
alias gc='git commit -m'
alias gl='git log -10 --pretty=format:"%h | %an | %ar | %s"'
alias glc='git log --stat --pretty="%C(Yellow)=====================================================================%n%h | %C(magenta)%an%Creset | %ad | %ar %n%n %B" --graph'
alias ga='git add'
alias gac='git commit -am'
alias gaa='git add .'
alias gs='git status'
alias gsh='git show'
alias gco='git checkout'
alias gcom='git checkout master'
alias gdal='gcom && gb | grep -v "master" | xargs git branch -D '
alias gmpl='gco master && gpl'
alias gmm='gm master'
alias gma='gm --abort'
alias gcob='git checkout -b'
alias grm='git rm'
alias ab='echo -e "\n***$(__git_ps1) ***"'
alias gchmod='git update-index --chmod=+x'
gacp() { gaa && gc "$1" && gp; }
gbd_all() { gbd $1 && gbdr $1; }
glg () { glc --grep=$1; }
gcp() { gc "$1" && gp; }

# Git
git_branch(){
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/';
}