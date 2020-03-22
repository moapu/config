new_ps1="\n${Red}=====[${Color_Off}\
${Cyan}\T${Color_Off} \
${Yellow}\w${Color_Off}\
${Red}]=====${Color_Off}\n\$ "

export EDITOR='npp -w'
export PS1="${new_ps1}"
export HISTTIMEFORMAT='%b %d %I:%M %p ' # using strftimr format
export HISTCONTROL=ignoreboth # ignoredups:ignorespace
export HISTIGNORE="history:pwd:exit:df:ls:ls -la:ll:l:c:x:d:h:bc:cd:src:"