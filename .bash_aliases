export EDITOR="vim"

# Git
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'
alias gb='git checkout -b'
alias gd='git diff'
alias gf='git fetch'
alias gu='git fetch; git status'

# yadm
alias ys='yadm status'
alias ya='yadm add'
alias yc='yadm commit'
alias yp='yadm push'
alias yd='yadm diff'
alias yup='yadm fetch; yadm status'

# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias tree='tree -a -C --dirsfirst -I ".git|.github|node_modules|resources"'
alias ls='ls --color=auto'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

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

# Hugo
alias hs='hugo server'
alias hst='hugo server -s exampleSite --themesDir=../.. --disableFastRender'

# Nix
alias nix-update='nix-channel --update; nix-env -iA nixpkgs.nix nixpkgs.cacert'
