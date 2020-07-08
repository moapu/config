file_names=(
  colors
  exports
  shortcut
  git
  programming
  personal
)

for file in "${file_names[@]}"; do
  source H:/Desktop/Git/config/bashConfig_${file}.sh
done

track_git() {
  if [ -d .git ]; then

    modified_count=$(git status | grep "modified" -c)
    if [[ ${modified_count} -gt 0 ]]; then
      printf " ${BRed}[${modified_count}+]${Color_Off}"
    fi
	
    deleted_count=$(git status | grep "deleted" -c)
    if [[ ${deleted_count} -gt 0 ]]; then
      printf " ${BRed}[${deleted_count}-]${Color_Off}"
    fi

  fi
}

export PS1='\
\[\]\n\n\[\]
\['""${BWhite}'\]---\['"${Color_Off}"'\]\
\['"${BCyan}"'\] \T \['"${Color_Off}"'\]\
\['"${BPurple}"'\]@\u\['"${Color_Off}"'\]\
\['"${BYellow}"'\] \w\['"${Color_Off}"'\]\
\['"${BGreen}"'\]`__git_ps1`\['"${Color_Off}"'\]\
\[`track_git`\]\
\['""${BWhite}'\] --- \['"${Color_Off}"'\]\
\[\]\n\[\]\
\['"${BWhite}"'\]➤➤➤ \['"${Color_Off}"'\]\
\[\]'

