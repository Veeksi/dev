# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git asdf zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source ~/.zsh_profile

# Yay alias
alias yay='paru'
alias vim='nvim'

# Disable underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Disable bracketed paste
zle_bracketed_paste=0

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Starship
eval "$(starship init zsh)"

# Java
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH="$JAVA_HOME/bin:$PATH"

# Android
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"

# Ruby gems path (only if you actually need this fixed version)
export PATH="$HOME/.local/share/gem/ruby/3.4.0/bin:$PATH"

# Vim
bindkey -v

# Ruby
eval "$(rbenv init - zsh)"

# Zoxide
eval "$(zoxide init zsh --cmd cd)"

source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
