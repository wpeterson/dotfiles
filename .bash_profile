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
alias set-remote-upstream="git branch --set-upstream-to=origin/\$(__git_ps1 %s) \$(__git_ps1 %s)"
alias master='git checkout master'
alias rubyLint='git diff --name-only master..$(__git_ps1 %s) | grep \\.rb | xargs rubocop'

# Project/Rails Aliases
alias b='bundle exec'
alias h='heroku'
alias r='rails'
alias zen="~/src/zen_chimes/bin/chime_runner.rb"
alias rt='~/src/zen_chimes/bin/chime_runner.rb rake test'

alias bi='bundle install'
alias bo='EDITOR=subl bundle open'
alias bd='rm -rf .bundle .bin'
alias ks='cd ~/src//studio'
alias kit='cd ~/src//image_transcoder'
alias kios='cd ~/src//ios_resque_endpoint'
alias kr='cd ~/src//katama_runtime'
alias kmd='cd ~/src//mobile_debug'
alias kpms='cd ~/src//pm_sender'
alias kd='cd ~/src//devops'
alias mmd='cd ~/src//mock_maitred_server'
alias chef='cd ~/src//chef'

alias pr='cd ~/src/polar-rails'
alias pi='cd ~/src/polar-ios'
alias pid='cd ~/src/polar-integration-docs'
alias pwp='cd ~/src/polar-wordpress-plugin'
alias pas='cd ~/src/polar-auto-scale'

alias ezr='cd ~/src/ez-rails'

alias util_ssh='ey ssh --environment=ez_prod2 --utilities=Utility'
alias fluent_stage_ssh='ssh 10.206.24.45'
alias fluent_prod_ssh='ssh 10.11.22.228'

# IRB Shell config
IRBRC=./config/.irbrc

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Default Project
cd ~/src/ez-rails
