BREW_PREFIX=`brew --prefix`
if [ ! -f $BREW_PREFIX/etc/bash_completion ]; then
  echo Installing bash-completion...
  brew install bash-completion
fi
. $BREW_PREFIX/etc/bash_completion
