Github + gopass setup

1. log in to normal github using 2fa
1. Transfer GPG key from old laptop: https://makandracards.com/makandra-orga/37763-gpg-extract-private-key-and-import-on-different-machine
1. Set GPG key to ultimate trust (https://security.stackexchange.com/questions/129474/how-to-raise-a-key-to-ultimate-trust-on-another-machine)
1. Generate a new SSH key and add it to Github: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent as well as to people app
1. `brew install gopass`
1. `gopass clone git@github.com:lycarter/pass.git`
1. `cd /Users/lcarter && git clone git@github.com:lycarter/configs.git`
1. `cd configs && ./makesymlinks.sh` -> restart iterm

Laptop setup
1. Install Spectacle (https://www.spectacleapp.com/)
1. For iterm2, go to preferences -> profiles -> keys -> key mappings and choose the "natural text editing" preset
1. Install vscode
1. Add `code` command https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line

Dev environment setup
1. `brew install jenv` -> reopen shell -> ensure `jenv doctor` is happy enough
1. `brew tap homebrew/cask-versions`
1. `brew install zulu11 zulu15 zulu17`
1. `for i in /Library/Java/JavaVirtualMachines/*.jdk; do jenv add "$i/Contents/Home"; done`
1. Add existing gpg signatures from Yubikey (`<internal github>/<information security>/yubikey-provisioning/blob/master/MacOS/import-existing-key.sh`)