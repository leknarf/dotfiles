# Steps to setup new Mac

## OS X configuration
- Move dock to left
- Desktop & Screen Saver -> Disable translucent menu bar
- Mission Control -> Hot Corners:
  - Upper-right: Put Display to Sleep
  - Lower-left: Desktop
  - Lower-right: Mission Control
- Language & Text -> Show Input menu in menu bar
- Universal Access
  - Enable access for assistive devices
  - Flash the screen when an alert occurs
- Displays
  - Show displays in menu bar
  - Disable "Automatically adjust brightness"
- Set Keyboard
  - Disable "Automatically illuminate keyboard in low light"
  - Use all F1, F2, etc. keys as standard function keys
  - Key Repeat = Fast
  - Modifier Keys -> swap control/capslock

## Install
- 1Password
- Chrome
- Dropbox
- F.lux
- Navicat
- Skype
- VLC
- iTerm2

 Open XCode at least once and install the command line tools: Preferences -> Downloads
 In iterm2:

   enable "load preferences from user-defined folder" -> "/Users/andrew/Dropbox/Development/dotfiles
   Preferences -> Colors -> Load Presets -> Solarized Dark

## Install homebrew:

  /usr/bin/ruby -e $(curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)

## Run setup scripts

1. setup_new_env.sh
1. create_soft_links.rb
1. update_bundles.rb
