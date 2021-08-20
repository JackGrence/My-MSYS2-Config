alias sshreg='eval $( ssh-agent -s ) && ssh-add ~/.ssh/github'
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias starttmux='eval "$(curl -sL https://gist.githubusercontent.com/JackGrence/8c1407442faf21aa58fe5ea37cdfb566/raw/f2688e6e696e535a43a109755da7b3478aca2b25/starttmux.sh)"'
alias msys2='export PATH=${PATH//\/mingw[63][42]\/bin:/}; export MSYSTEM=MSYS2'
alias mingw64='msys2; export PATH=/mingw64/bin:$PATH; export MSYSTEM=MINGW64'
alias mingw32='msys2; export PATH=/mingw32/bin:$PATH; export MSYSTEM=MINGW32'
