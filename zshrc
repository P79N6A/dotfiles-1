#antigene
source /usr/local/share/antigen/antigen.zsh
antigen init ~/.antigenrc


export GO15VENDOREXPERIMENT=1


# source file
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# clean repeat path
PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++')

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval $(thefuck --alias)
