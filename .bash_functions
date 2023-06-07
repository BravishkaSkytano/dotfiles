# Git
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1="\[\033[01;32m\]\w \[\033[01;34m\]\$(parse_git_branch)\[\033[00m\]\$ "

git_init() {
    if [ -z "$1" ]; then
        printf "%s\n" "Please provide a directory name.";
    else
        mkdir "$1";
        builtin cd "$1" || return
        pwd;
        git init;
        touch readme.md .gitignore LICENSE;
        echo "# $(basename "$PWD")" >> readme.md
    fi
}

git_clone() {
    read -rp "Username: " username
    read -rp "Repo: " repo
    git clone https://github.com/$username/$repo.git
    cd "$repo"
}

# Managing files
menu() {
    select OPT in "./" *; do
        if [ "$OPT" = "./" ]; then
            CURDIR=$(dirs +0)
            read -rp "Enter filename: " FILENAME
            read -rp "Create $CURDIR/$FILENAME? [y/n]: " choice
            case $choice in
                [yY]* ) $EDITOR "$FILENAME" ;;
                [nN]* ) menu ;;
            esac
        elif [ -d "$OPT" ]; then
            cd "$OPT" || return
            menu
        elif [ -f "$OPT" ]; then
            $EDITOR "$OPT"
        fi
        break
    done
}

# Hugo
new_site() {
    # Make sure user supplies a title
    if [ -z "$1" ]; then
        echo 'You must supply a site name, e.g.'
        echo '  new_site my-new-site'
        return 1
    fi

    hugo new site "$1"
    cd "$1"
    git init
    cp ~/scripts/hugo_new ./new
    echo "Done with setup!"
}

log() {
    YEAR=$(date +%Y)
    MONTH=$(date +%m)
    DAY=$(date +%d)
    ENTRY="diary/$YEAR/$MONTH"

    cd
    if [ ! -e $ENTRY ]; then mkdir -p $ENTRY; fi
    cd $ENTRY

    if [ ! -f $DAY.md ]; then
        # add template data for Hugo
        TITLE=$(date +"%A, %B %d")
        DATE=$(date +%F)
        echo "---
title: $TITLE
date: $DATE
categories: []
tags: []
---" >> $DAY.md
    fi

    echo "" >> $DAY.md # line break
    date +'## %R' >> $DAY.md
    echo "" >> $DAY.md # another line break
    nano $DAY.md

    cd ../..
    git add $YEAR/$MONTH/$DAY.md
    git commit -m "Add $MONTH-$DAY"
    cd
}
