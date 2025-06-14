# -------------------------------
# Homebrew 配置
# -------------------------------
BREW_CMD="$(command -v brew)"
if [ -n "$BREW_CMD" ]; then
  eval "$($BREW_CMD shellenv)"
fi

# 如果存在 .bashrc，则加载它
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

