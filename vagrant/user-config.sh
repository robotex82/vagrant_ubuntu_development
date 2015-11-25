#!/bin/bash -xe

# Configure git
git config --global user.email "roberto@vasquez-angel.de"
git config --global user.name "Roberto Vasquez Angel"
git config --global push.default simple
git config --global credential.helper "cache --timeout=3600"

tee --append ~/.gitconfig << 'OUT'

[alias]
    co = checkout
    ec = config --global -e
    up = !git pull --rebase --prune $@ && git submodule update --init --recursive
    cob = checkout -b
    cm = !git add -A && git commit -m
    save = !git add -A && git commit -m 'SAVEPOINT'
    wip = !git add -u && git commit -m "WIP" 
    undo = reset HEAD~1 --mixed
    amend = commit -a --amend
    wipe = !git add -A && git commit -qm 'WIPE SAVEPOINT' && git reset HEAD~1 --hard
    bclean = "!f() { git branch --merged ${1-master} | grep -v " ${1-master}$" | xargs -r git branch -d; }; f"
    bdone = "!f() { git checkout ${1-master} && git up && git bclean ${1-master}; }; f"
OUT

# Install RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash
source "$HOME/.rvm/scripts/rvm"
  
# Install ruby 2.2.3
rvm install 2.2.3

# Install jruby 9.0.3.0
rvm install 9.0.3.0

# Set ruby 2.2.3 as default
rvm --default use 2.2.3

# Install a better prompt
git clone https://github.com/nojhan/liquidprompt.git
echo '[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt' >> ~/.bashrc

  
# Install sublime package installer
curl -sL https://sublime.wbond.net/Package%20Control.sublime-package > ~/.config/sublime-text-3/Installed\ Packages/Package\ Control.sublime-package
tee  ~/.config/sublime-text-3/Packages/User/Package\ Control.sublime-settings << OUT
{
    "installed_packages":
    [
        "BeautifyRuby",
        "DocBlockr",
        "Emmet",
        "GitGutter",
        "GitStatus",
        "Package Control",
        "RuboCop",
        "SideBarEnhancements",
        "SideBarFolders",
        "SublimeLinter",
        "SublimeLinter-rubocop",
        "SublimeLinter-ruby"
    ]
}
OUT

# Add sublime settings
tee ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings << 'OUT'
{
  "color_scheme": "Packages/User/SublimeLinter/Monokai (SL).tmTheme",
  "tab_size": 2,
  "translate_tabs_to_spaces": true,
  "hot_exit": false,
  "remember_open_files": false
}
OUT

# Add sublime keybindings
tee ~/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymap << 'OUT'
[
  { "keys": ["ctrl+7"], "command": "toggle_comment", "args": { "block": false } },
  { "keys": ["ctrl+shift+7"], "command": "toggle_comment", "args": { "block": true } }
]
OUT


# Add lazy clone command to bash
tee --append ~/.bashrc << 'OUT'

# Add lazy clone command to bash
function gc {
    url=$1;
    reponame=$(echo $url | awk -F/ '{print $NF}' | sed -e 's/.git$//');
    git clone $url $reponame;
    cd $reponame;
}
OUT