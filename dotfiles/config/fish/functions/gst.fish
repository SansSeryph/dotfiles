function gst --wraps='git status --show-stash' --description 'alias gst=git status --show-stash'
  git status --show-stash $argv; 
end
