#!/usr/bin/env bash

# Install command-line tools using Homebrew.

#
# First things first: Check if Homebrew is installed
#
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    # https://github.com/mxcl/homebrew/wiki/installation
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    # Make sure we're using the latest Homebrew
    brew update
fi

# Upgrade any already-installed formulae.
brew upgrade

# Install cask to manage OS X apps...
brew tap homebrew/cask

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`. To do so, run `sudo chsh -s /usr/local/bin/bash`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install gnupg
brew install gnupg

# Install more recent versions of some macOS tools.
brew install homebrew grep
brew install homebrew openssh
brew install homebrew screen
#brew install homebrew/php/php56 --with-gmp

# Install font tools.
# brew tap bramstein/webfonttools
# brew install sfnt2woff
# brew install sfnt2woff-zopfli
# brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
# brew install xz
brew install rclone
brew install jdupes

# Install other useful binaries.
brew install git
brew install git-lfs
# brew install imageoptimagemagick --with-webp
brew install bat
brew install prettyping
brew install fzf
brew install htop
brew install fd
brew install jq
brew install p7zip
brew install pigz
brew install ncdu
brew install rename
brew install ack
brew install speedtest_cli
brew install ssh-copy-id
# brew install testssl
brew install tree
brew install webkit2png
brew install zopfli

# Programming thingies
brew install python3
brew install node

brew install tldr
brew install ponysay

# OS X Stuff
brew cask install dropbox
#brew cask install evernote
brew cask install firefox
#brew cask install imageoptim
brew cask install iterm2
#brew cask install postbox
#brew cask install postman
brew cask install visual-studio-code
#brew cask install handbrake
brew cask install keepassxc
#brew cask install stellarium
brew cask install insomnia
brew cask install little-snitch
brew cask install calibre

# from app store
#magnet
#(office)
#steuertipps
#hp druckerzeugs

# Remove outdated versions from the cellar.
brew cleanup
