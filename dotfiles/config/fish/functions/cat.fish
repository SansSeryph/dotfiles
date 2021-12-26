function cat --wraps='bat --theme=TwoDark' --wraps='bat --theme=Dracula' --wraps='bat --theme=Dracula -pp' --description 'alias cat=bat --theme=Dracula -pp'
  bat --theme=Dracula -pp $argv; 
end
