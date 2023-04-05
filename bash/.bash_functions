# Git
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1="\[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

git_init() {
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
run_stow() {
    echo "Running stow..."
    cd ~/.dotfiles
    for d in $(ls -d */ | cut -f1 -d '/');
    do
        ( stow "$d" )
    done
    echo "Done."
}

# Hugo + my notes
create_file() {
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

new_note() {
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

open_note() {
    path=~/notes
    error=">>> Invalid Selection"

    cd $path/content
    printf "Select note:\n"
    select f in ./**/*.md; do
        vim $f && break ;
        echo "$error" ;
    done
}
