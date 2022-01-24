function berjw --wraps='bundle exec rails jobs:work' --description 'alias berjw=bundle exec rails jobs:work'
  bundle exec rails jobs:work $argv; 
end
