if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='mvim'
 fi
export EDITOR='nvim'


#antigene
source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen theme tonyseek/oh-my-zsh-seeker-theme seeker
#plugins=(git z brew python pip virtualenv pyenv virtualenvwrapper tmux tmuxinator common-aliases go)
#plugins =(virtualenvwrapper)

antigen bundle osx
antigen bundle git
antigen bundle z
antigen bundle brew
antigen bundle python
antigen bundle pip
antigen bundle pyenv
antigen bundle virtualenv
antigen bundle virtualenvwrapper
antigen bundle tmux
antigen bundle tmuxinator
antigen bundle common-aliases
antigen bundle go
antigen bundle history-substring-search

antigen apply


#Export Variables
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export TEST_URL="http://0.0.0.0:8080"
export HOMEBREW_GITHUB_API_TOKEN="021f916b34aff5765aa9870664b5af5475128852"
export PATH=/Users/levi/dev_thunder/script:$PATH

# for go
export GOPATH=/Users/levi/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

# for xunlei
export SL_ENV="DEV"

#export PATH="$PATH":~/anaconda2/bin

#aliases
#[[ -f ~/.aliases ]] && source ~/.aliases
