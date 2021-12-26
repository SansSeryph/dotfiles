function pai --wraps='pikaur --sync --needed --noconfirm' --description 'alias pai=pikaur --sync --needed --noconfirm'
  pikaur --sync --needed --noconfirm $argv; 
end
