function backups
  echo 'source ~/.bashrc' >> ~/.bash_profile
  cp ~/.zshrc ~/.config/nvim/.zshrc
  cp ~/.tmux.conf ~/.config/nvim/.tmux.conf
  cp ~/.config/polybar/config.ini ~/.config/nvim/polybar/
  cp ~/.config/polybar/launch.sh ~/.config/nvim/polybar/
  cp ~/.config/starship.toml ~/.config/nvim/starship.toml
  cp -r ~/.config/fish ~/.config/nvim/
  echo (set_color -o brwhite) 'Backup done.'
end
