all: uninstall install

install:
	ln -s $$PWD/vim/vimrc $$HOME/.vimrc
	ln -s $$PWD/vim $$HOME/.vim
	ln -s $$PWD/zsh/zshrc $$HOME/.zshrc
	ln -s $$PWD/zsh $$HOME/.zsh
	ln -s $$PWD/Xresources $$HOME/.Xresources
	ln -s $$PWD/xinitrc $$HOME/.xinitrc
	@curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh || echo "neobundle is allready installed"

uninstall:
	rm -f $$HOME/.vimrc
	rm -Rf $$HOME/.vim
	rm -f $$HOME/.zshrc
	rm -Rf $$HOME/.zsh
	rm -f $$HOME/.Xresources
	rm -f $$HOME/.xinitrc

gui:
	rm -Rf $$HOME/.xmonad
	rm -Rf $$HOME/.icons/dzen2
	mkdir $$HOME/.xmonad
	ln -s $$PWD/xmonad/xmonad.hs $$HOME/.xmonad/xmonad.hs
	ln -s $$PWD/xmonad/status_bar $$HOME/.xmonad/status_bar
	ln -s $$PWD/xmonad/user_bar $$HOME/.xmonad/user_bar
	ln -s $$PWD/xmonad/dzen2 $$HOME/.icons/dzen2
