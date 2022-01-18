function ls --wraps='exa --long --git --group-directories-first --color=always' --description 'alias ls=exa --long --git --group-directories-first --color=always'
  exa --long --git --group-directories-first --color=always --icons --header $argv; 
end
