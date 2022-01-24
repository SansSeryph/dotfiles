function bers --wraps='bundle exec rails server' --description 'alias bers=bundle exec rails server'
  bundle exec rails server $argv; 
end
