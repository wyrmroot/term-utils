#!/bin/bash

while [ : ]
do
        clear
        date +"%a %e %H:%M"
        curl wttr.in/Columbus+OH?0
        read -t 300 -s -n 1 key
        case $key in
                q|Q) break ;;
        esac
done
