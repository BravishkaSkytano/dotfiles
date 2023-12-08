#  ┌─┐┬  ┬┌─┐┌─┐
#  ├─┤│  │├─┤└─┐
#  ┴ ┴┴─┘┴┴ ┴└─┘

alias cl="clear"
alias music="ncmpcpp"

alias ls='eza -aFH --icons --group-directories-first --git -1'
alias ls='eza -a --color=always --group-directories-first --icons' # preferred listing
alias ll='eza -al --color=always --group-directories-first --icons' # long format
alias lt='eza -aT --color=always --group-directories-first --icons --ignore-glob=".git|node_modules|dotbot"' # tree listing
alias l.='eza -ald --color=always --group-directories-first --icons .*' # show only dotfiles
alias lg='eza -al --color=always --group-directories-first --icons --git' # show git status

#alias hs='hugo server'
#alias hst='hugo server -s exampleSite --themesDir=../.. --disableFastRender'
