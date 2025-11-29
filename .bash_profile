# -------------------------------
# Homebrew 配置
# -------------------------------
BREW_CMD="$(command -v brew)"
if [ -n "$BREW_CMD" ]; then
  # Pass explicit shell name so shellenv doesn't call /bin/ps (which may be blocked)
  eval "$($BREW_CMD shellenv bash)"
fi

# 如果存在 .bashrc，则加载它
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
