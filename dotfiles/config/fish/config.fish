if status is-interactive
  set --local os (uname -s)

  if [ $os = "Darwin" ]
    set -x BREW_PREFIX (brew --prefix)
    eval ($BREW_PREFIX/bin/brew shellenv)
    source $BREW_PREFIX/opt/asdf/libexec/asdf.fish
  else if [ $os = "Linux" ]
    source /opt/asdf-vm/asdf.fish
  end
end

# This is an ignored file that gets used to set up things that are needed for
# specific devices
if [ -e ~/.config/fish/device_specific.fish ]
  source ~/.config/fish/device_specific.fish
end
