all: uninstall install

install:
	ln -s $$PWD/vimrc $$HOME/.vimrc
	ln -s $$PWD/Xresources $$HOME/.Xresources
	ln -s $$PWD/xinitrc $$HOME/.xinitrc

uninstall:
	rm -f $$HOME/.vimrc
	rm -f $$HOME/.Xresources
	rm -f $$HOME/.xinitrc
