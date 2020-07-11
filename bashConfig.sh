. H:/Desktop/Git/config/bashConfig_shortcut.sh
. H:/Desktop/Git/config/bashConfig_colors.sh
. H:/Desktop/Git/config/bashConfig_git.sh
. H:/Desktop/Git/config/bashConfig_programming.sh
. H:/Desktop/Git/config/bashConfig_exports.sh
. H:/Desktop/Git/config/bashConfig_personal.sh

track_git() {
  if [ -d .git ]; then

    modified_count=$(git status | grep "modified|new file" -c)
    if [[ ${modified_count} -gt 0 ]]; then
      printf " ${BRed}[${modified_count}+]${Color_Off}"
    fi

    deleted_count=$(git status | grep "deleted" -c)
    if [[ ${deleted_count} -gt 0 ]]; then
      printf " ${BRed}[${deleted_count}-]${Color_Off}"
    fi

  fi
}

function t_now() {
  date +%s%3N
}

function t_start() {
  t_start=${t_start:-$(t_now)}
}

function t_stop() {
  local d_ms=$(($(t_now) - $t_start))
  local d_s=$((d_ms / 1000))
  local ms=$((d_ms % 1000))
  local s=$((d_s % 60))
  local m=$(((d_s / 60) % 60))
  local h=$((d_s / 3600))

  if ((h > 0)); then
    t_show=${h}h${m}m
  elif ((m > 0)); then
    t_show=${m}m${s}s
  elif ((s >= 10)); then
    t_show=${s}.$((ms / 100))s
  elif ((s > 0)); then
    t_show=${s}.$((ms / 10))s
  else
    t_show=${ms}ms
  fi

  unset t_start
}

set_prompt() {
  t_stop
}

trap 't_start' DEBUG
PROMPT_COMMAND='set_prompt'

export PS1='\
\[\]\n\n\[\]
\['""${BWhite}'\]---\['"${Color_Off}"'\]\
\['"${BCyan}"'\] \T \['"${Color_Off}"'\]\
\['"${BBlue}"'\]($t_show) \['"${Color_Off}"'\]\
\['"${BPurple}"'\]@\u\['"${Color_Off}"'\]\
\['"${BYellow}"'\] \w\['"${Color_Off}"'\]\
\['"${BGreen}"'\]`__git_ps1`\['"${Color_Off}"'\]\
\[`track_git`\]\
\['""${BWhite}'\] --- \['"${Color_Off}"'\]\
\[\]\n\[\]\
\['"${BWhite}"'\]➤➤➤ \['"${Color_Off}"'\]\
\[\]'
