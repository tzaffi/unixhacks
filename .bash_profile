export GOPATH=~/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:~/go/bin:/usr/local/sbin

# MacPorts Installer addition on 2015-09-10_at_12:03:00: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:/Users/zephaniahgrunschlag/bin/:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


export NVM_DIR="/Users/zephaniahgrunschlag/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export NVM_DIR="$HOME/.nvm"
source "/usr/local/opt/nvm/nvm.sh"

alias g='git'
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'
alias gg='glock sync -n < GLOCKFILE'
alias gl='git log'
alias gs='git status'
alias lsgp='ls | xargs -I {} sh -c "cd {} && git pull"'
alias rg='rg -S --ignore-file ~/.rgignore --sort-files'

alias bb='cd $GOPATH/src/github.com/getbread/breadbox'

alias fdeploy-prod='knife ssh "(role:services OR role:webservers) AND (chef_environment:production OR chef_environment:prodsandbox)" "sudo touch /opt/bread/force_deploy; sudo chef-client;"'
alias ryandeploy-dev='knife ssh "(chef_environment:development OR chef_environment:devsandbox)" "sudo chef-client;"'

# Path to the bash it configuration
export BASH_IT="/Users/zephaniahgrunschlag/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
source $BASH_IT/bash_it.sh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

source /Users/zephaniahgrunschlag/go/src/github.com/getbread/breadbox/scripts/.apache_env

