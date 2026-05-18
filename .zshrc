HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000        # in-memory history size
SAVEHIST=100000        # how many lines to keep in the file
EDITOR=nvim

setopt EXTENDED_HISTORY       # timestamps etc
setopt APPEND_HISTORY         # append instead of overwrite
setopt INC_APPEND_HISTORY     # write each command immediately
setopt SHARE_HISTORY          # share history across sessions

# Nice history hygiene
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS       # ignore immediate duplicate
setopt HIST_IGNORE_ALL_DUPS   # drop older dupes
setopt HIST_IGNORE_SPACE      # commands starting with space not saved
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY            # don’t auto-run expanded history lines

# --- Completion system ---
autoload -Uz compinit
if [[ ! -d $HOME/.zcompdump ]] || [[ ~/.zshrc -nt ~/.zcompdump ]]; then
  compinit
else
  compinit -C      # faster, use cached completion
fi

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*'

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
set +e

source ~/.aliases
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# bun completions
[ -s "/home/ahmad/.bun/_bun" ] && source "/home/ahmad/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export GPG_TTY=$(tty)

eval $(thefuck --alias)
