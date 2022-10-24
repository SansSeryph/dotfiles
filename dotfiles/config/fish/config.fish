if status is-interactive
  set --local os (uname -s)

  if test $os = "Darwin"
    source /usr/local/opt/asdf/libexec/asdf.fish
  else if test $os = "Linux"
    source /opt/asdf-vm/asdf.fish
  else
    echo "OS type not listed"
  end

  set --local bin_dir ~/Workspace/bin
  if test -d $bin_dir
    set --append PATH $bin_dir
  end
end

# This is an ignored file that gets used to set up things that are needed for
# specific devices
if [ -e ~/.config/fish/device_specific.fish ]
  source ~/.config/fish/device_specific.fish
end
