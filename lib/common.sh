## Common Aliases and Oneliners
## ============================
##
##     (c) 2011 Ben, untar.org
##

alias slrn="slrn -n"
alias man='LC_ALL=C LANG=C man'
alias f=finger
alias ll='ls -al'
alias ls='ls --color=auto '
alias offlineimap-tty='offlineimap -u TTY.TTYUI'
alias hnb-partecs='hnb $HOME/partecs/partecs-hnb.xml'
alias rest2html-css='rst2html --embed-stylesheet --stylesheet-path=/usr/share/python-docutils/s5_html/themes/default/print.css'
#if [[ $HOSTNAME == "kamna" ]] {
#	alias emacs='emacs -l ~/.emacs.kamna'
#}	

# alias	=clear

#chpwd() {
#     [[ -t 1 ]] || return
#     case $TERM in
#     sun-cmd) print -Pn "\e]l%~\e\\"
#     ;;
#    *xterm*|screen|rxvt|(dt|k|E)term) print -Pn "\e]2;%~\a"
#    ;;
#    esac
#}
selfupdate(){
        URL="http://stuff.mit.edu/~jdong/misc/zshrc"
        echo "Updating zshrc from $URL..."
        echo "Press Ctrl+C within 5 seconds to abort..."
        sleep 5
        cp ~/.zshrc ~/.zshrc.old
        wget $URL -O ~/.zshrc
        echo "Done; existing .zshrc saved as .zshrc.old"
}
#chpwd


# set platform (win, linux, ...)
platform='unknown' 
unamestr=$(uname)
platform=''
if [ "$unamestr" = 'Darwin' ]; then
	platform='darwin'
fi



# grep
alias glir='grep -lir'

# gvim

if [ "$platform" = 'darwin' ]; then
	alias gvim='mvim --servername GVIM --remote'
	alias safari='/Applications/Safari.app/Contents/MacOS/Safari'
	alias browser='safari'
fi

# less

alias less='/usr/share/vim/vim72/macros/less.sh'

# start firefox

alias ff='firefox'
alias cp='cp -R'
alias c='cd '
alias home='cd ~'
#alias lsl="echo shit"
alias ..='cd ..'
alias rm='rm -i'
alias shortdate='date +"%Y-%m-%d"'
alias vi='vim -c NERDTree'
alias gvi='gvim --servername GVIM --remote-tab'
#alias gvim="gvim 2> /dev/null"
alias gvim='gvim --servername MIV --remote'
alias tvim='gvim --servername localhost --remote-silent-tab 2>/dev/null'
alias chmox='chmod 0755'
alias vman='doc-vman'

alias muindex='mu index --maildir ~/mail/inbox/'
alias mufind='mu find -m ~/mail/inbox -c -l ~/mail/search' # -c: clearlinks, -l make links into ...
alias muresults='mutt -f ~/mail/search/'

# go to ...

alias gow='pushd ~/kit/Worklog'
alias gbin='pushd ~/bin'


# open ...
alias ow="vim ~/kit/Worklog/`date +%Y-%m-%d`.txt"
alias oaliases="vim ~/bin/aliases"


# abbrevs
alias l='ls'
alias s='ls'
alias sls='ls'
