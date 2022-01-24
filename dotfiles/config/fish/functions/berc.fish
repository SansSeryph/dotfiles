function berc --wraps='bundle exec rails console' --description 'alias berc=bundle exec rails console'
  bundle exec rails console $argv; 
end
