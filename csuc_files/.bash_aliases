
if [ -x /usr/bin/dircolors ]; then
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"





#backups 
alias rsyncStarWars='rsync -rtvu --progress /home/jfarinos/backups/ /media/jfarinos/448A-2067/CSUC/backups/'
alias rsyncAll='rsync -rtvu --progress $1 $2'


#Conexiones remotas
alias sshDspace='ssh  -p 2122 jfarinos@84.88.31.73'
#alias Porta='porta.xgm.csuc.cat' 
alias sshPorta='ssh  jfarinos@porta.xgm.csuc.cat -p40022'
alias sshRacoTest='ssh  jfarinos@84.88.13.194 -p40022'
alias sshDmp-pre='ssh -p2122 jfarinos@192.168.72.19'
alias sshUbuntu='ssh -p22 jfarinos@84.88.31.76'


#open ports
alias openports='netstat -tulanp'

#############SYSTEM#########

## pass options to free ##
alias meminfo='free -m -l -t'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'








# Alias  .gitconfig
alias gitoneline="git log --oneline --decorate --graph"
alias gitonelinedates="git log --pretty=format:'%h was %an, %ai, message: %s'" 
#alias gitlogall="git log --pretty=format:'%h was %an, %ai,message:%s' --oneline --decorate"

alias gitlogall="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

#rsync 
alias rsyncDir='rsync --progress -avh'



## ls ## {{{
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias lsdir='find . -maxdepth 1 -type d'	#list directory
alias ll='ls -ltr'	#list with date sort ASC
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
alias contarDirectorios='ls -lR | grep ^d | wc -l'
# }}}

### Aptitude ###
#alias aptitude='sudo aptitude'

## APT-GET
#alias aptsearch='sudo apt-cache show'
alias aptsearch='sudo apt-cache search'
alias aptsearchall='sudo apt-cache showpkg'

#alias grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
#alias buscarCadena='grep -rnw $1 -e $2' #search and show files with number line 

#alias top
alias topuser='top -u $user'    				
    								
#alias rm
alias rm='rm -rfv'
    						
#alias mkdir
alias mkdir='mkdir -pv'
 
#alias mount pretty
alias mount='mount |column -t'
 
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


## Comands with rsync
#alias rsyncUpdate='rsync -avu --progress' #
#alias rsyncSincro='rsync -rtvu --delete --progress' #syncronice two directorys 


# r = recursive
# t = conserve time modify files
# v = output info 
# u = update origin/ destine/



## Safety features ## {{{
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -I'
#safer alternative w/ timeout, not stored in history

## Editors
alias nano='nano -c'
alias edit='vim'
alias vi=vim




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


alias raspbe='ssh -p 333 anikras@jafamo.ddns.net'
alias dockerSonarqube='docker run -d --name sonarqube -p 9000:9000 -p 9092:9092'

