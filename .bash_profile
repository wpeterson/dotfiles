if [ -f ~/.secrets ]; then
  source ~/.secrets
fi

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=/Applications/GitX.app/Contents/Resources:$PATH
export PATH=~/scripts:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
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

# export GIT_PS1_SHOWDIRTYSTATE=true
# export GIT_PS1_SHOWUPSTREAM=git
export PS1='\[\e[1;34m\][$(__git_ps1 "%s") \[\e[0m\]\w\[\e[1;34m\]]\$> \[\e[0m\]'
export PS1="\[\033[G\]$PS1"

export ANDROID_HOME=/work/android-sdk-macosx

# Readline Config
bind 'set completion-ignore-case on'
bind 'set completion-prefix-display-length 2'
bind 'set show-all-if-ambiguous on'

# Less Paging Config
alias less="less -X"

alias netwtf='sudo /usr/local/Cellar/mtr/0.87/sbin/mtr -n 8.8.8.8'

# Git Aliases
alias gpo="git push origin \$(__git_ps1 %s)"
alias gpoh='git push origin head'
alias gg='git grep -in'
alias ggc='git grep -in --function-context'
alias gpr='git pull --rebase --stat'
alias gbsu="git branch --set-upstream-to=origin/\$(__git_ps1 %s) \$(__git_ps1 %s)"
alias gitFresh="git checkout master; git pull --rebase; git checkout -; git rebase master"
alias set-remote-upstream="git branch --set-upstream-to=origin/\$(__git_ps1 %s) \$(__git_ps1 %s)"
alias master='git checkout master'
alias rubyLint='git diff --name-only master..$(__git_ps1 %s) | grep \\.rb | xargs rubocop'

# Rails Aliases
alias b='bundle exec'
alias h='heroku'
alias r='rails'
alias zen="~/src/zen_chimes/bin/chime_runner.rb"
alias rt='~/src/zen_chimes/bin/chime_runner.rb rake test'
alias bi='bundle install'
alias bo='EDITOR=subl bundle open'

# Node / Yarn Aliases
alias y='yarn'

# Project Aliases
alias ezd='cd ~/src/delivery'
alias ezi='cd ~/src/identity'
alias ezr='cd ~/src/ez-rails'
alias ezm='cd ~/src/ezmanage-ui'
alias kafka='cd ~/src/kafka-docker; docker/start'

alias prod_scheduler_ssh='ssh 10.11.22.218'
alias fluent_stage_ssh='ssh 10.206.24.45'
alias fluent_prod_ssh='ssh 10.11.22.228'

# IRB Shell config
IRBRC=./config/.irbrc

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Default Project
cd ~/src/ez-rails
export PATH="/usr/local/opt/node@8/bin:$PATH"
