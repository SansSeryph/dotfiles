function berr --wraps='bundle exec rails routes --expanded' --description 'alias berr=bundle exec rails routes --expanded'
  bundle exec rails routes --expanded $argv; 
end
