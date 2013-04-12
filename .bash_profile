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

alias mate=subl

# Git Aliases
alias gpo="git push origin \$(__git_ps1 %s)"
alias gpoh='git push origin head'
alias gg='git grep -in'
alias ggc='git grep -in --function-context'
alias gpr='git pull --rebase --stat'
alias git-scoreboard="git shortlog -n -s -e"
alias master='git checkout master'

# Heroku aliases
alias deployStaging="git push staging \$(__git_ps1 %s):master"
alias deployProduction="git push production \$(__git_ps1 %s):master"

# Project/Rails Aliases
alias b='bundle exec'
alias bi='bundle install --path .bundle --binstubs .bin'
alias bo='EDITOR=mate bundle open'
alias bd='rm -rf .bundle .bin'
alias ks='cd /work/studio'
alias kit='cd /work/image_transcoder'
alias kios='cd /work/ios_resque_endpoint'
alias kr='cd /work/katama_runtime'
alias kmd='cd /work/mobile_debug'
alias kpms='cd /work/pm_sender'
alias kd='cd /work/katama_deploy'
alias mmd='cd /work/mock_maitred_server'
alias chef='cd /work/chef'

alias pr='cd ~/src/polar-rails'
alias pi='cd ~/src/polar-ios'

alias dev_ssh='ssh -l ubuntu -i ~/.ec2/katama-integration.pem'
alias prod_ssh='ssh -l ubuntu -i  ~/.ec2/katama-prod.pem'
alias webuser_ssh='ssh -l web-user -i ~/.ec2/webuser.pem'
alias pudding='ssh pudding.whatbox.ca'

pr

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
