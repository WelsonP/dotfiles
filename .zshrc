# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen load romkatv/powerlevel10k powerlevel10k
    zgen load zsh-users/zsh-autosuggestions 
    zgen load unixorn/autoupdate-zgen 
    zgen load zsh-users/zsh-completions 
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search 

    # save all to init script
    zgen save
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended --height 40% --border"

# Set default search to fd rather than find, if it is installed.
if type fd &>/dev/null; then
    export FZF_DEFAULT_COMMAND="fd --type f"
else
    >&2 echo "Warning: fd not available; fzf defaulting to find"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Aliases
alias dev='cd ~/Development'
alias school='cd ~/School'
alias downloads='cd ~/Downloads'

alias ls='ls -G'
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gau='git add --update'
alias gc='git commit -mv'
alias gca='git commit -amv'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcotb='git checkout --track -b'
alias glog='git log'
alias glogp='git log --pretty=format:"%h %s" --graph'
alias grd='git rebase develop'
alias gb='git branch'
