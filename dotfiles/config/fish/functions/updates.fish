function updates
  switch (uname -s)
    case Darwin
      brew update
      brew upgrade
      sudo softwareupdate --install --all
      sudo mas upgrade
    case Linux
      sudo rankmirrors --country United_States,Canada --api --protocols https
      pikaur -Syyu --noconfirm
  end

  tldr --update_cache
  yarn global upgrade --latest
  asdf plugin update --all
  gem update && gem cleanup

  pip install --upgrade pip
  for i in (pip list --user --outdated | awk 'NR > 2 {print $1}')
    pip install --user --upgrade --progress-bar pretty $i
  end

  nvim +PackerSync +q
end
