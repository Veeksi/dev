export XDG_CONFIG_HOME="$HOME/.config"

# Editors
export EDITOR="nvim"
export VISUAL="nvim"
export GIT_EDITOR="$EDITOR"

# Dev paths
export DEV_ENV_HOME="$HOME/git/dev"

# Go
export GOPATH="$HOME/.local/go"

# Java
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"

# Android
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"

# Ruby gems path (keep only if you truly need this exact version path)
export GEM_HOME="$HOME/.local/share/gem/ruby/3.4.0"
export GEM_PATH="$GEM_HOME"
export PATH="$GEM_HOME/bin:$PATH"

# Flyctl (only if set)
if [[ -n "${FLYCTL_INSTALL:-}" ]]; then
  export PATH="$FLYCTL_INSTALL/bin:$PATH"
fi

# ---------------------------
# PATH helpers (no duplicates)
# ---------------------------
path_prepend() {
  local p="$1"
  [[ -d "$p" ]] || return 0
  case ":$PATH:" in
    *":$p:"*) ;;
    *) PATH="$p:$PATH" ;;
  esac
}

path_append() {
  local p="$1"
  [[ -d "$p" ]] || return 0
  case ":$PATH:" in
    *":$p:"*) ;;
    *) PATH="$PATH:$p" ;;
  esac
}

# Preferred PATH order (front)
path_prepend "$HOME/.local/bin"
path_prepend "$HOME/.local/go/bin"
path_prepend "/usr/local/go/bin"
path_prepend "$JAVA_HOME/bin"
path_prepend "$ANDROID_HOME/emulator"
path_prepend "$ANDROID_HOME/tools"
path_prepend "$ANDROID_HOME/tools/bin"
path_prepend "$ANDROID_HOME/platform-tools"
path_prepend "$HOME/.zig"
path_prepend "$HOME/.local/zig"

# Append
path_append "$HOME/.cargo/bin"

export PATH

# ---------------------------
# Small helper functions
# ---------------------------
catr() {
  # catr <startLine> <endLine> <file>
  tail -n "+$1" "$3" | head -n "$(($2 - $1 + 1))"
}

cat1Line() {
  tr -d "\n" < "$1"
}
