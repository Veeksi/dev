# ~/.zshrc

# Ensure XDG_CONFIG_HOME exists early
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Load environment (exports/PATH/functions)
[[ -f "$XDG_CONFIG_HOME/zsh/env.zsh" ]] && source "$XDG_CONFIG_HOME/zsh/env.zsh"

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git asdf zsh-autosuggestions)
source "$ZSH/oh-my-zsh.sh"

# Aliases
alias yay='paru'
alias vim='nvim'

# Disable underline highlights (if zsh-syntax-highlighting is used)
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Disable bracketed paste (note: can affect some terminals; keep if you want)
zle_bracketed_paste=0

# Vi mode
bindkey -v

# Starship prompt
eval "$(starship init zsh)"

# fzf (Arch package paths)
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh

# Ruby (rbenv)
command -v rbenv >/dev/null 2>&1 && eval "$(rbenv init - zsh)"

# Zoxide
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh --cmd cd)"

# Syntax highlighting plugin (ensure it exists)
if [[ -f "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
