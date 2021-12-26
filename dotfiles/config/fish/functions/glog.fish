function glog --wraps='git log --oneline --graph --decorate --all' --description 'alias glog=git log --oneline --graph --decorate --all'
  git log --oneline --graph --decorate --all $argv; 
end
