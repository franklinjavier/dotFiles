# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme robbyrussell

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

function infograficos 
	cd ~/root/svn/branches/infograficos
end

function jsuol
	cd ~/root/svn/webcontent/com/jsuol/c/
end

function cachevm
	cd ~/root/svn/webcontent/br/com/uol/commons/static/v1/web/estrutura/
end

function uolutils
	cd ~/root/svn/webcontent/com/jsuol/c/_template/v1/web/js/
end
