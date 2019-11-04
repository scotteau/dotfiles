# combined by avit and kardan

function get_host {
    echo '@'$HOST
}

# 参考 https://zhuanlan.zhihu.com/p/51008087
function _fish_collapsed_pwd() {
    if [[ "$PWD" == "$HOME" ]] {
        echo "~"
        return
    } elif [[ "$PWD" == "/" ]] {
        echo "/"
        return
    }
    local pwd="${PWD/$HOME/~}"
    local names=("${(s:/:)pwd}")
    local length=${#names}
    for i ({1..$[length-1]}) {
        local name=$names[$i]
        if [[ $name[1] == "." ]] {
            names[$i]=$name[1,2]
        } else {
            names[$i]=$name[1]
        }
    }
    echo ${(j:/:)names}
}


PROMPT='➤ '
PROMPT2='? '
RPROMPT='$(_fish_collapsed_pwd) ${_return_status}'

local _return_status="%{$fg_bold[red]%}%(?..⍉)%{$reset_color%}"
