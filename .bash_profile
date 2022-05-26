if [ -f ~/.secrets ]; then
  source ~/.secrets
fi

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
export PS1='\e[1;32m\][${AWS_PROFILE:-default}]\[\e[1;34m\][$(__git_ps1 "%s") \[\e[0m\]\w\[\e[1;34m\]]\$> \[\e[0m\]'
export PS1="\[\033[G\]$PS1"

export AWS_REGION=us-east-2
export AWS_PROFILE=staging

ec2 () {
    PATTERN=$1
    REGION=${2:-us-east-2}

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

alias netwtf='sudo /usr/local/Cellar/mtr/0.87/sbin/mtr -n 8.8.8.8'

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
alias nx='nix-shell --command "$(declare -p PS1); return"'
alias overmindReload='overmind kill; sleep 2; overmind start'

# Terragrunt Aliases
alias tgrp='terragrunt run-all plan -out .plan | less -R'
alias tgra='terragrunt run-all apply .plan'

# Project Aliases

# IRB Shell config
IRBRC=./config/.irbrc

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# added by Nix installer
#if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi
#export NIX_PATH=$NIX_PATH:bbpkgs=https://github.com/BookBub/nixpkgs/archive/VERSION.tar.gz

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Setup direnv hooks
# eval "$(direnv hook bash)"
