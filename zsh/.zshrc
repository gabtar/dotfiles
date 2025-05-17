# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="arrow-custom"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  forgit
  zsh-autosuggestions
  fzf-zsh-plugin
)

# Source config files
source $ZSH/oh-my-zsh.sh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
[ -f ~/.forgit/forgit.plugin.zsh ] && source ~/.forgit/forgit.plugin.zsh

# Autostart tmux
# if [ -z "$TMUX" ]
# then
#     tmux attach -t TMUX || tmux new -s TMUX
# fi

# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

alias glog="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

# Simple Colored go test
# https://stackoverflow.com/questions/27242652/colorizing-golang-test-run-output
alias gotest="go test -v . | sed ''/PASS/s//$(printf "\"\033[32mPASS\033[0m"\")/'' | sed ''/FAIL/s//$(printf "\"\033[31mFAIL\033[0m"\")/''"

# Arch updates
alias archupdate="sudo pacman -Syu"

# Needed for lombok in nvim
export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar"


# -----------------------------------------------------------------------------
# Environment variables
# -----------------------------------------------------------------------------
# Set default pager to none. Default in zsh is less
export PAGER=""

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Nvm / Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# The fuck
eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)

# JAVA
export JAVA_HOME="/home/gabtar/.jenv/versions/21.0.2"
export PATH=$JAVA_HOME/bin:$PATH

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Local binares
export PATH=/home/gabtar/.local/bin:$PATH

# pnpm
export PNPM_HOME="/home/gabtar/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# Composer
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

# Scala
export PATH="/home/gabtar/.local/share/coursier/bin:$PATH"

# Rsut
export CARGO_HOME="/home/gabtar/.cargo/bin/bin"
export PATH="$CARGO_HOME:$PATH"

# Load Angular CLI autocompletion.
source <(ng completion script)
