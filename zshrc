#antigene
source /usr/local/share/antigen/antigen.zsh
antigen init .antigenrc

#Export Variables
#export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export HOMEBREW_GITHUB_API_TOKEN="021f916b34aff5765aa9870664b5af5475128852"
PATH=/Users/levi/dev_thunder/script:$PATH

# for go
export GOPATH=/Users/levi/go
PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

# xunlei
export SL_ENV="DEV"
export TEST_URL="http://0.0.0.0:8080"

# anaconda 2
#export PATH="$PATH":~/anaconda2/bin

# for anaconda
#export PATH=/usr/local/anaconda3/bin:"$PATH"
#export PATH=~/anaconda2/bin:"$PATH"
export PATH

# neovim
export EDITOR='nvim'
alias vim="nvim"

#aliases
#[[ -f ~/.aliases ]] && source ~/.aliases

# useful function
function setproxy() {
    export ALL_PROXY=socks5://127.0.0.1:1080
}

function unsetproxy() {
    unset ALL_PROXY
}

