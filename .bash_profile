source ~/.ec2/.katama_keys

export PATH=/Applications/GitX.app/Contents/Resources:$PATH
export PATH=~/scripts:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=./.bin:$PATH

export PT_TOKEN="9b3f913fd39f940bfc4febc0bd60b9dc"

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
  . `brew --prefix`/etc/bash_completion.d/git-prompt.sh
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

alias mate="echo 'mate alias deprecated!!!'; subl"

# Git Aliases
alias gpo="git push origin \$(__git_ps1 %s)"
alias gpoh='git push origin head'
alias gg='git grep -in'
alias ggc='git grep -in --function-context'
alias gpr='git pull --rebase --stat'
alias set-remote-upstream="git branch --set-upstream-to=origin/\$(__git_ps1 %s) \$(__git_ps1 %s)"
alias master='git checkout master'

# Heroku aliases
alias deployStaging="git push -f staging \$(__git_ps1 %s):master"
alias deployProduction="git push -f production \$(__git_ps1 %s):master && h run rake db:migrate -r production"

# Project/Rails Aliases
alias b='bundle exec'
alias h='heroku'
alias r='rails'
alias zen="~/src/zen_chimes/bin/chime_runner.rb"
alias rt='~/src/zen_chimes/bin/chime_runner.rb rake test'

alias bi='bundle install --path .bundle --binstubs .bin'
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

alias dev_ssh='ssh -l ubuntu -i ~/.ec2/katama-integration.pem'
alias prod_ssh='ssh -l ubuntu -i  ~/.ec2/katama-prod.pem'
alias webuser_ssh='ssh -l web-user -i ~/.ec2/webuser.pem'
alias pudding='ssh pudding.whatbox.ca'

# IRB Shell config
IRBRC=./config/.irbrc

pr

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
