# -------------------------------
# Bash 历史记录设置（记录所有命令）
# -------------------------------

# 当前 shell 会话可记住的命令数量
HISTSIZE=99999

# .bash_history 文件中最多保存的命令条数
HISTFILESIZE=99999

# 每条历史记录添加时间戳（格式：年-月-日 时:分:秒）
export HISTTIMEFORMAT="%F %T "

# 实时将命令追加到历史文件（跨多个窗口共享历史）
export PROMPT_COMMAND='history -a'

# 不忽略任何命令（包括重复和前面有空格的）
export HISTCONTROL=

# -------------------------------
# 常用 alias（可按需修改或扩展）
# -------------------------------

alias ll="ls -lahG"
alias la="ls -AG"
alias l="ls -CFG"
alias gs="git status"
alias ..="cd .."
alias ...="cd ../.."

# -------------------------------
# PATH 扩展（示例：添加 ~/bin 目录）
# -------------------------------

# Add common Homebrew locations so `brew` works even if they are not already
# in PATH. This covers Apple Silicon Macs (`/opt/homebrew`) and Intel Macs
# (`/usr/local`).
if [ -d "/opt/homebrew/bin" ]; then
  export PATH="/opt/homebrew/bin:$PATH"
fi
if [ -d "/opt/homebrew/sbin" ]; then
  export PATH="/opt/homebrew/sbin:$PATH"
fi
if [ -d "/usr/local/bin" ]; then
  export PATH="/usr/local/bin:$PATH"
fi

export PATH="$HOME/bin:$PATH"

# -------------------------------
# bash-completion（如果安装了的话）
# -------------------------------

if command -v brew >/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [ -f "$HOMEBREW_PREFIX/etc/bash_completion" ]; then
    source "$HOMEBREW_PREFIX/etc/bash_completion"
  fi
  export PATH="$HOMEBREW_PREFIX/bin:$PATH"
  # mysql-client configuration (keg-only, not symlinked into Homebrew prefix)
  MYSQL_CLIENT_PREFIX="$HOMEBREW_PREFIX/opt/mysql-client"
  if [ -d "$MYSQL_CLIENT_PREFIX" ]; then
    # Add mysql-client binaries to PATH
    export PATH="$MYSQL_CLIENT_PREFIX/bin:$PATH"

    # Set compiler flags for mysql-client (needed by build systems)
    export LDFLAGS="-L$MYSQL_CLIENT_PREFIX/lib${LDFLAGS:+ $LDFLAGS}"
    export CPPFLAGS="-I$MYSQL_CLIENT_PREFIX/include${CPPFLAGS:+ $CPPFLAGS}"

    # Set PKG_CONFIG_PATH for pkgconf/pkg-config
    MYSQL_CLIENT_PKGCONFIG="$MYSQL_CLIENT_PREFIX/lib/pkgconfig"
    if [ -d "$MYSQL_CLIENT_PKGCONFIG" ]; then
      export PKG_CONFIG_PATH="$MYSQL_CLIENT_PKGCONFIG${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}"
    fi
  fi
fi

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
export PATH="$PATH:/Applications/Tailscale.app/Contents/MacOS"

export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8

# -------------------------------
# Gemini CLI 快捷命令
# -------------------------------

mini-ask() {
    source ~/venv/bin/activate && python3 ~/Projects/DAYS/20251121/gemini_python_small_script/gemini_python_small_script.py "$@"
}
