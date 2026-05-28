# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false
persistent_apps=(
  "/Applications/Firefox.app"
  "/Applications/WezTerm.app"
)

defaults write com.apple.dock persistent-apps -array

for path in "${persistent_apps[@]}"; do
  defaults write com.apple.dock persistent-apps -array-add \
    "<dict>
      <key>tile-data</key>
      <dict>
        <key>file-data</key>
        <dict>
          <key>_CFURLString</key>
          <string>${path}</string>
          <key>_CFURLStringType</key>
          <integer>0</integer>
        </dict>
      </dict>
      <key>tile-type</key>
      <string>file-tile</string>
    </dict>"
done


# Finder
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder FXDefaultSearchScope -string "SCsp"


# General 
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 14
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
# Key Mapping
# Caps Lock: 0x700000039
# Left Control: 0x7000000E0
hidutil property --set '{
  "UserKeyMapping": [
    {
      "HIDKeyboardModifierMappingSrc": 0x700000039,
      "HIDKeyboardModifierMappingDst": 0x7000000E0
    }
  ]
}' > /dev/null

killall Dock
killall Finder
killall SystemUIServer

#Hammerspoon config location
defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"

# Setup symlinks
ln -s ~/.config/system/zsh/.zshenv ~/.zshenv
mkdir -p ~/.config/zsh
ln -s ~/.config/system/zsh/.zshrc ~/.config/zsh/.zshrc
ln -s ~/.config/system/Brewfile ~/Brewfile
ln -s ~/.config/system/gitconfig ~/.gitconfig
ln -s ~/.config/system/nvim ~/.config
ln -s ~/.config/system/wezterm ~/.config
ln -s ~/.config/system/terminal ~/.config
ln -s ~/.config/system/hammerspoon ~/.config

touch ~/.hushlogin

mkdir -p ~/project
if [ ! -e "~/.config/sessionizer_paths" ]; then
  touch ~/.config/sessionizer_paths
  printf '%s\n' "project" > ~/.config/sessionizer_paths
fi

brew bundle --global --no-upgrade

