#antigene
source /usr/local/share/antigen/antigen.zsh
antigen init .antigenrc


#Export Variables
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export HOMEBREW_GITHUB_API_TOKEN="021f916b34aff5765aa9870664b5af5475128852"
export PATH=/Users/levi/dev_thunder/script:$PATH

# for go
export GOPATH=/Users/levi/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

# for xunlei
export SL_ENV="DEV"
export TEST_URL="http://0.0.0.0:8080"

#export PATH="$PATH":~/anaconda2/bin

# for neovim
export EDITOR='nvim'

#aliases
#[[ -f ~/.aliases ]] && source ~/.aliases
alias vim="nvim"
