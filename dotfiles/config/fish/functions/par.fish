function par --wraps='pikaur --remove --recursive --noconfirm' --description 'alias par=pikaur --remove --recursive --noconfirm'
  pikaur --remove --recursive --noconfirm $argv; 
end
