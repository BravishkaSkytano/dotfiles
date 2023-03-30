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

# Git
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gl='git log --oneline'
alias gb='git checkout -b'
alias gd='git diff'

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

# Directories
alias ..='cd ..;pwd'
alias ...='cd ../..;pwd'
alias ....='cd ../../..;pwd'
alias c='clear'
alias h='history'

# Calendar
alias jan='cal -m 01'
alias feb='cal -m 02'
alias mar='cal -m 03'
alias apr='cal -m 04'
alias may='cal -m 05'
alias jun='cal -m 06'
alias jul='cal -m 07'
alias aug='cal -m 08'
alias sep='cal -m 09'
alias oct='cal -m 10'
alias nov='cal -m 11'
alias dec='cal -m 12'

# Notes
function create-file() {
    read -p "Enter filename: " filename
    read -p "Create $dir$filename? (y/n/c):- " choice
    case $choice in
        [yY]* ) hugo new $dir$filename && vim content/$dir$filename && exit ;;
        [nN]* ) create-file ;;
        [cC]* ) exit ;;
        * ) echo "$error" ;;
    esac
}

function new-note() {
    shopt -s globstar
    
    path=~/notes
    error=">>> Invalid Selection"

    cd $path/content
    prinf "Select folder:\n"
    select dir in ./**/ ; do
        echo "You selected '$dir'"; break ;
        echo "$error" ;
    done

    cd ..
    create-file
}
