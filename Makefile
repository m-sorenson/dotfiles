all: uninstall install

install:
	mkdir -p $$HOME/.config/nvim
	ln -s $$PWD/nvim/init.vim $$HOME/.config/nvim/init.vim
	ln -s $$PWD/zsh/zshrc $$HOME/.zshrc
	ln -s $$PWD/zsh $$HOME/.zsh
	@curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

uninstall:
	rm -f $$HOME/.config/nvim/init.vim
	rm -f $$HOME/.zshrc
	rm -Rf $$HOME/.zsh
