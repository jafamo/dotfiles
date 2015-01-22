
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    
####rsync con host:server

#alias rsyncServer='rsync -rtvz /home/$user/programacion/workspace/Servlets/ root@server:/root/servlets/'


## ls ## {{{
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias lsdir='find . -maxdepth 1 -type d'	#list directory
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
# }}}

### Aptitude ###
alias aptitude='sudo aptitude'


    						
    #alias grep
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'


    #alias top
    #alias topuser='top -u $user'    				
    								
    #alias rm
    alias rm='rm -rfv'
    						
    #alias mkdir
    alias mkdir='mkdir -pv'
  
  #alias wget
  # r   recursive
  # k   convert links ith relatives path offline
  # c	continue downloading
  # p   add images
  # http://www.muylinux.com/2009/02/17/descarga-webs-completas-con-wget
  #alias wgetdescarga='wget -rkcp'
  
  alias wgetdescarga='wget --random-wait -r -p -e robots=off -U mozilla'
    					

## New commands ## {{{
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep'         # requires an argument
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias pgg='ps -Af | grep'           # requires an argument
alias ..='cd ..'
# }}}


## Safety features ## {{{
alias cprsync='rsync -P'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -I'
#safer alternative w/ timeout, not stored in history


man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
      man "$@"
}


fi



