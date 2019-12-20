# 限制单条历史记录长度
# return 1: will not be saved
# reutnr 2: saved on the internal history list
function zshaddhistory() {
    if (($#1 > 160)) {
        return 2
    }
    return 0
}

HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

# 记录时间戳
setopt extended_history
# 首先移除重复历史
setopt hist_expire_dups_first
# 忽略重复
setopt hist_ignore_dups
# 忽略空格开头的命令
setopt hist_ignore_space
# 展开历史时不执行
setopt hist_verify
# 按执行顺序添加历史
setopt inc_append_history
# 共享历史数据
setopt share_history