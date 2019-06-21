#!/bin/sh

##
## COLORIZE BASH PROMT
##
bash_prompt() {

 ############################################################################
 ## COLOR CODES                                                            ##
 ## These can be used in the configuration below                           ##
 ############################################################################
 
 ## FONT EFFECT
 local      NONE='0'
 local      BOLD='1'
 local       DIM='2'
 local UNDERLINE='4'
 local     BLINK='5'
 local    INVERT='7'
 local    HIDDEN='8'
 
 
 ## COLORS
 local   DEFAULT='9'
 local     BLACK='0'
 local       RED='1'
 local     GREEN='2'
 local    YELLOW='3'
 local      BLUE='4'
 local   MAGENTA='5'
 local      CYAN='6'
 local    L_GRAY='7'
 local    D_GRAY='60'
 local     L_RED='61'
 local   L_GREEN='62'
 local  L_YELLOW='63'
 local    L_BLUE='64'
 local L_MAGENTA='65'
 local    L_CYAN='66'
 local     WHITE='67'
 
 
 ## TYPE
 local     RESET='0'
 local    EFFECT='0'
 local     COLOR='30'
 local        BG='40'
 
 
 ## 256 COLOR CODES
 local NO_FORMAT="\[\033[0m\]"
 local ORANGE_BOLD="\[\033[1;38;5;208m\]"
 local TOXIC_GREEN_BOLD="\[\033[1;38;5;118m\]"
 local RED_BOLD="\[\033[1;38;5;1m\]"
 local CYAN_BOLD="\[\033[1;38;5;87m\]"
 local BLACK_BOLD="\[\033[1;38;5;0m\]"
 local WHITE_BOLD="\[\033[1;38;5;15m\]"
 local GRAY_BOLD="\[\033[1;90m\]"
 local BLUE_BOLD="\[\033[1;38;5;74m\]"
 
 # GENERATE SEPARATORS WITH FANCY TRIANGLE
 local TRIANGLE=$(printf '\xee\x82\xb0')
 local GIT=$(printf '\xee\x82\xa0')

 colored_text ()
 {
     FG=$2
     BG=$3
     case $# in
     2)
        echo "\[\033[0;$((30+${!FG}))m\] $1 \[\033[00m\]"
     ;;
     3)
        echo "\[\033[0;01;$((30+${!FG}));$((40+${!BG}))m\] $1 \[\033[00m\]"
     ;;
     esac

 }

 colored_triangle ()
 {
     BG=$1
     NG=$2
     case $# in
     0)
        echo "\[\033[00m\]$TRIANGLE\[\033[00m\]"
     ;;
     1)
        echo "\[\033[0;$((30+${!BG}))m\]$TRIANGLE\[\033[00m\]"
     ;;
     2)
         echo "\[\033[0;$((30+${!BG}));$((40+${!NG}))m\]$TRIANGLE\[\033[00m\]"
     ;;
     esac
 }

 banner ()
 {
     case $# in
     1)
         echo $1
     ;;
     2)
         echo "$(colored_text $1 $2)$(colored_triangle)"
     ;;
     3)
         echo "$(colored_text $1 $2 $3)$(colored_triangle $3)"
     ;;
     4)
         echo "$(colored_text $1 $2 $3)$(colored_triangle $3 $4)"
     ;;

     esac
 }

 rectangle ()
 {
     case $# in
     1)
         echo $1
     ;;
     2)
         echo "$(colored_text $1 $2)"
     ;;
     3)
         echo "$(colored_text $1 $2 $3)"
     ;;
     esac
 }




 ############################################################################
 ## BASH PROMT                                                             ##
 ## Generate promt and remove format from the rest                         ##
 ############################################################################

 TYP=(0 0 0 1)
 TXT=('\u' '\h' '\w' '$(git_prompt)')
 FGS=(BLACK BLACK BLACK RED)
 BGS=(GREEN L_GRAY L_BLUE)
 n=${#TXT[@]}

 PS1=
 for i in $(seq 0 $((n-1)))
 do
     typ="${TYP[i]}"
     if [ $typ == "0" ]
     then
         PS1="${PS1}$(banner ${TXT[i]} ${FGS[i]} ${BGS[i]} ${BGS[i+1]})"
     elif [ $typ == "1" ]
     then
         PS1="${PS1}$(rectangle ${TXT[i]} ${FGS[i]} ${BGS[i]})"
     fi
 done
 #PS1="$PS1 "
 PS1="$PS1\n$ "

}




################################################################################
##  MAIN                                                                      ##
################################################################################

## Bash provides an environment variable called PROMPT_COMMAND. 
## The contents of this variable are executed as a regular Bash command 
## just before Bash displays a prompt. 
## We want it to call our own command to truncate PWD and store it in NEW_PWD
#PROMPT_COMMAND=bash_prompt_command

## Call bash_promnt only once, then unset it (not needed any more)
## It will set $PS1 with colors and relative to $NEW_PWD, 
## which gets updated by $PROMT_COMMAND on behalf of the terminal
bash_prompt
unset bash_prompt
