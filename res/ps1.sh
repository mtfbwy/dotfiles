#!/bin/bash

# set prompting; see PROMPTING in bash manual
function bash_ps1() {
    local readonly titlebar="\[\e]2;\u@\h:\w\a\]";
    local readonly prefix="\[\e[32;40m\]----------------------------------------\[\e[m\]\n";
    local readonly time="\[\e[37m\]\t\[\e[0m\]";
    local readonly host="\[\e[32m\]\H\[\e[0m\]";
    local readonly wdir="\[\e[33m\]\w\[\e[0m\]";
    local readonly user="\[\e[36m\]\u\[\e[0m\]";
    local readonly prompt="\[\e[31m\]\$\[\e[0m\] ";
    case $TERM in
    linux)
        #echo "$prefix$user@$host:$wdir\n$prompt";
        echo "$user@$host:$wdir\n$prompt";
    ;;
    *-256color)
        #echo "$prefix$titlebar$wdir\n$prompt";
        echo "$titlebar$time $user@$host:$wdir\n$prompt";
    ;;
    esac
}

# would go with solarized for grays
function bash_ps1_style2() {
    local readonly time="\[\e[37m\]\t\[\e[0m\]";
    local readonly host="\[\e[1;32m\]\H\[\e[0m\]";
    local readonly wdir="\[\e[1;34m\]\w\[\e[0m\]";
    local readonly user="\[\e[1;36m\]\u\[\e[0m\]";
    local readonly prompt="\[\e[37m\]\$\[\e[0m\]";
    case $TERM in
    linux)
        echo "$user@$host:$wdir\n$prompt ";
    ;;
    *-256color)
        local readonly title="\[\e]2;\u@\h:\w\a\]";
        echo "$title$time $user@$host:$wdir\n$prompt ";
    ;;
    esac
}

PS1=`bash_ps1_style2`

unset -f bash_ps1
unset -f bash_ps1_style2
