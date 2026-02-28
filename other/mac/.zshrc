# Exports
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:/opt/homebrew/bin:/$HOME/flutter/bin:$PATH
export ANDROID_HOME=/Users/${USER}/Library/Android/sdk
export ANDROID_SDK_ROOT=/Users/${USER}/Library/Android/sdk
export ANDROID_AVD_HOME=/Users/${USER}/.android/avd
export ZSH="$HOME/.oh-my-zsh"
export JAVA_HOME="$HOME/Library/Java/JavaVirtualMachines/jbr-17.0.8.1/Contents/Home"

# Aliases
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias cd="z"

# Disable underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
    kubectl
)

# Sources
source ~/.nvm/nvm.sh
source $ZSH/oh-my-zsh.sh

# Vim mode
bindkey -v

# Starship
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
