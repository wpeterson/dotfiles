if [ -f ~/.secrets ]; then
  source ~/.secrets
fi

export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH=/opt/homebrew/bin:$PATH
export PATH=/Applications/GitX.app/Contents/Resources:$PATH
export PATH=~/scripts:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/10/bin
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH=./.bin:$PATH

export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
  . `brew --prefix`/etc/bash_completion.d/git-prompt.sh
else
  echo "WARN: Bash Completion not found.  Install via:"
  echo "   brew install bash-completion"
fi

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export EDITOR=vim
export PS1='\[\e[1;34m\][$(__git_ps1 "%.20s") \[\e[0m\]\W\[\e[1;34m\]]\$> \[\e[0m\]'
if [[ -n "$IN_NIX_SHELL" ]]; then
  nix_flag='\[\e[0;32m\][NX]'
  export PS1="\[\033[G\]$nix_flag$PS1"
else
  export PS1="\[\033[G\]$PS1"
fi


export AWS_REGION=us-east-1
# export AWS_PROFILE=staging

ec2 () {
    PATTERN=$1
    REGION=${2:-us-east-1}

    aws ec2 describe-instances \
        --region=${REGION} \
        --filters Name=tag:Name,Values=${PATTERN}* \
        --query 'Reservations[].Instances[].[PrivateIpAddress,InstanceId,Tags[?Key==`Name`].Value[]]' \
        --output text | sed 's/None$/None\n/' | sed '$!N;s/\n/ /'
}

# Readline Config
bind 'set completion-ignore-case on'
bind 'set completion-prefix-display-length 2'
bind 'set show-all-if-ambiguous on'

# Less Paging Config
alias less="less -X"

# Git Aliases
alias gpo="git push -u origin HEAD"
alias gg='git grep -in'
alias ggc='git grep -in --function-context'
alias gpr='git pull --rebase --stat'
alias gbsu="git branch --set-upstream-to=origin/\$(__git_ps1 %s) \$(__git_ps1 %s)"
alias gitFresh="git checkout main; git pull --rebase; git checkout -; git rebase main"
alias set-remote-upstream="git branch --set-upstream-to=origin/\$(__git_ps1 %s) \$(__git_ps1 %s)"
alias master='git checkout master'
alias main='git checkout main'
alias rubyLint='git diff --name-only master..$(__git_ps1 %s) | grep \\.rb | xargs rubocop'

alias b='bundle exec'
alias h='heroku'
alias r='rails'
alias bi='bundle install'
alias bo='EDITOR=subl bundle open'

# Python Aliases
alias python=python3
alias per='pipenv run'

alias k='kubectl'
alias please='sudo'

# NIX / overmind
alias nx='nix-shell --run bash'
alias overmindReload='overmind kill; sleep 2; overmind start'

# Production EC2 Aliases
alias ec2-production="ec2 '*bookbub.com*' | grep 10\.0"
alias ec2-staging="ec2 '*kobubob.com*' | grep 10\.1"

# Project Aliases
alias clippy='cd ~/src/clippy'
alias docs='cd ~/src/docs'
alias lello='cd ~/src/lello'
alias laminar='cd ~/src/laminar'
alias mockingjay='cd ~/src/mockingjay'
alias nest='cd ~/src/nest'
alias nile='cd ~/src/nile'
alias pince='cd ~/src/pince'
alias plural='cd ~/src/plural'
alias pulp='cd ~/src/pulp'
alias taft='cd ~/src/taft'
alias templater='cd ~/src/templater'
alias valve='cd ~/src/valve'
alias wf='cd ~/src/wellfleet'

# IRB Shell config
IRBRC=./config/.irbrc

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# BookBub Config
export BBWORKSPACE=/Users/winfield/src

# added by Nix installer
if [ -e /Users/winfield/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/winfield/.nix-profile/etc/profile.d/nix.sh; fi

# Tab Completion Config(s)
complete -F _ssh sesh
complete -F _scp seshcp

# Setup direnv hooks
eval "$(direnv hook bash)"

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

ssh-add ~/.ssh/id_rsa
