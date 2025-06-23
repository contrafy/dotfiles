source ~/.aliases
source ~/.keys

zstyle :compinstall filename '/home/contrafy/.zshrc'

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v

eval "$(starship init zsh)"

# bun completions
[ -s "/home/contrafy/.bun/_bun" ] && source "/home/contrafy/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:/snap/bin:$PATH"
export KUBECONFIG="/home/contrafy/.kube/.config"

# for git GPG signing
export GPG_TTY=$(tty)

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/contrafy/go/bin

source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh-autosuggestions/zsh-autosuggestions.zsh
fpath+=(~/.zsh-completions/src)
