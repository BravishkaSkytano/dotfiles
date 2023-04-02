# Git
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1="\[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'
alias gb='git checkout -b'
alias gd='git diff'
alias gf='git fetch'

function git_init() {
    if [ -z "$1" ]; then
        printf "%s\n" "Please provide a directory name.";
    else
        mkdir "$1";
        builtin cd "$1";
        pwd;
        git init;
        touch readme.md .gitignore LICENSE;
        echo "# $(basename $PWD)" >> readme.md
    fi
}

# Stow
function run_stow() {
    echo "Running stow..."
    cd ~/.dotfiles
    for d in $(ls -d */ | cut -f1 -d '/');
    do
        ( stow "$d" )
    done
    echo "Done."
}

# Directories
alias ..='cd ..;pwd'
alias ...='cd ../..;pwd'
alias ....='cd ../../..;pwd'
alias tree='tree --dirsfirst -C'
alias ls='ls --color'


# Calendar
alias jan='cal -m jan'
alias feb='cal -m feb'
alias mar='cal -m mar'
alias apr='cal -m apr'
alias may='cal -m may'
alias jun='cal -m jun'
alias jul='cal -m jul'
alias aug='cal -m aug'
alias sep='cal -m sep'
alias oct='cal -m oct'
alias nov='cal -m nov'
alias dec='cal -m dec'

# Hugo + my notes
function create_file() {
    read -p "Enter filename: " filename
    read -p "Create $dir$filename? Yes(y) / No(n) / Go back(b) / Exit(e):- " choice
    case $choice in
        [yY]* ) hugo new $dir$filename && vim content/$dir$filename ;;
        [nN]* ) create_file ;;
        [bB]* ) new_note ;;
        [eE]* ) break ;;
        * ) echo "$error" ;;
    esac
}

function new_note() {
    shopt -s globstar

    path=~/notes
    error=">>> Invalid Selection"

    cd $path/content
    printf "Select folder:\n"
    select dir in ./**/; do
        echo "You selected '$dir'" && break ;
        echo "$error" ;
    done

    cd ..
    create_file
}

function open_note() {
    shopt -s globstar

    path=~/notes
    error=">>> Invalid Selection"

    cd $path/content
    printf "Select note:\n"
    select f in ./**/*.md; do
        vim $f && break ;
        echo "$error" ;
    done
}
