function updates
  switch (uname -s)
    case Darwin
      brew update
      brew upgrade
      sudo softwareupdate --install --all
      sudo mas upgrade
    case Linux
      sudo rankmirrors --country United_State,Canada --api --protocols https
      pikaur -Syyu --noconfirm
  end

  tldr --update_cache
  yarn global upgrade --latest
  asdf plugin update --all
  gem update

  pip install --upgrade pip
  pip list --user --outdated --format=freeze \
    | grep -v '^\-e' \
    | cut -d = -f 1 \
    | xargs -n1 pip install --upgrade --progress-bar pretty 2> /dev/null

  nvim +PackerSync +q
  omf update
end
