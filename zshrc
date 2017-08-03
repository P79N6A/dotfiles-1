#antigene
source /usr/local/share/antigen/antigen.zsh
antigen init .antigenrc

export PATH="$HOME/bin:$PATH";


# source file
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


