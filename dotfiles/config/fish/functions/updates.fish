function updates
  sudo rankmirrors --country United_State,Canada --api --protocols https
  pikaur -Syyu --noconfirm

  tldr --update_cache
  yarn global upgrade --latest
  asdf plugin update --all
  gem update

  pip install --upgrade pip
  pip list --outdated --format=freeze \
    | grep -v '^\-e' \
    | cut -d = -f 1 \
    | xargs -n1 pip install --upgrade --progress-bar pretty
end
