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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Aliases
alias ls='ls -G'
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff | mate'
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
