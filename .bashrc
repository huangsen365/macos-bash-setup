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

alias ll="ls -lah"
alias la="ls -A"
alias l="ls -CF"
alias gs="git status"
alias ..="cd .."
alias ...="cd ../.."

# -------------------------------
# PATH 扩展（示例：添加 ~/bin 目录）
# -------------------------------

export PATH="$HOME/bin:$PATH"

# -------------------------------
# bash-completion（如果安装了的话）
# -------------------------------

if [ -f /opt/homebrew/etc/bash_completion ]; then
  source /opt/homebrew/etc/bash_completion
fi

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
export PATH="$PATH:/Applications/Tailscale.app/Contents/MacOS"
export PATH="/opt/homebrew/bin:$PATH"

export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

export MYSQLCLIENT_CFLAGS=$(pkg-config --cflags mysqlclient)
export MYSQLCLIENT_LDFLAGS=$(pkg-config --libs mysqlclient)
