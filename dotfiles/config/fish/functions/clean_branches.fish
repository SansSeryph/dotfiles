function clean_branches --wraps='git branch | grep -Ev staging | xargs git branch -D' --description 'delete all branches except default branch'
  set -l default_branch (git symbolic-ref --short refs/remotes/origin/HEAD | sed 's:origin/::')
  git switch $default_branch
  git branch | grep -Ev $default_branch | xargs git branch -D $argv; 
end
