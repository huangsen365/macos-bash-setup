# -------------------------------
# Homebrew 配置
# -------------------------------
eval "$(/opt/homebrew/bin/brew shellenv)"

# 如果存在 .bashrc，则加载它
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

