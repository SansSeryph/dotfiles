function gsc --wraps='git stash --include-untracked' --description 'alias gsc=git stash --include-untracked'
  git stash --include-untracked $argv; 
end
