function fish_prompt
  echo

  # User
  set_color -d brcyan
  echo -n [(whoami)@(hostname)]

  # Git Info (if CWD has it)
  set -l git_branch_name (git branch --show-current 2> /dev/null)
  set_color -d brgreen
  echo -n " ["$git_branch_name"]"

  # PWD
  set_color -d bryellow
  echo " ["(prompt_pwd)"]"

  # Prompty Part
  set_color normal
  echo -n '-> '
end
