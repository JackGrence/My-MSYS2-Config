
all: ubuntu_package tmux vimplugin ctag urxvt conf2home

ubuntu_package:
	sudo apt-get install python3-pip python-dev build-essential tmux automake pkg-config curl
	sudo python3 -m pip install powerline-shell
	sudo python -m pip install virtualenvwrapper
	sudo apt-get install rxvt-unicode

tmux:
	pushd ~
	git clone https://github.com/gpakosz/.tmux.git
	ln -s -f .tmux/.tmux.conf
	cp .tmux/.tmux.conf.local .
	popd

conf2home:
	cp -a configs/. ~/

home2conf:
	for i in `find configs/ -type f -printf "%P\n"`; do; cp ~/$i configs/$i; done

vimplugin:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim -c 'PluginInstall' -c 'qa!'

ctag:
	pushd /tmp
	git clone https://github.com/universal-ctags/ctags.git
	cd ctags
	./autogen.sh
	./configure
	make
	sudo make install
	popd

urxvt:
	pushd /tmp
	git clone https://github.com/majutsushi/urxvt-font-size.git
	mkdir -p ~/.urxvt/ext/
	cp urxvt-font-size/font-size ~/.urxvt/ext/
	popd
