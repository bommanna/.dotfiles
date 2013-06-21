# FILES = $(shell find . -maxdepth 1 \( -type f -o -type d \) \( ! -iname "Makefile" ! -iname "." ! -iname ".git" ! -iname "README.rst"  ! -iname "util" \)) 
FILES = .vim .bash_profile .bashrc .editrc .inputrc .tmux.conf .vimrc .ctags
CONFIG_FOLDERS = git

all: safe

safe: move link submodules

new: clear link submodules

# update/initialize submodules
submodules:
	@echo 'Updating submodules...'
	git submodule update --init

# renames all files that would be overwritten to filename.old
move:
	@echo 'Moving old dotfiles...'
	@for i in $(FILES); do \
		FP="$(HOME)/$${i#\./}"; \
		if [ -e $$FP ]; then \
			echo "$$FP -> $$FP.old"; \
			mv $$FP "$$FP.old"; \
		fi; \
	done

# creates the symlinks
link:
	@echo 'Creating new symlinks...'
	@for i in $(FILES); do \
		SP="$(HOME)/$${i#\./}"; \
		DP="$(CURDIR)/$${i#\./}"; \
		ln -s $$DP $$SP; \
	done
	@if [ ! -d "$(HOME)/.config" ]; then \
		echo "Creating .config directory"; \
		mkdir "$(HOME)/.config"; \
	fi;
	@echo "$(CURDIR)";
	@for i in $(CONFIG_FOLDERS); do \
		SP="$(HOME)/.config/$${i#\./}"; \
		DP="$(CURDIR)/.config/$${i#\./}"; \
		ln -s $$DP $$SP; \
	done

# removes all files that where moved
clear:
	@echo 'Deleting old dotfiles...'
	@for i in $(FILES); do \
		FP="$(HOME)/$${i#\./}"; \
		if [ -e $$FP ]; then \
			rm "$$FP"; \
			echo "$$FP deleted"; \
		fi; \
		FP="$(HOME)/$${i#\./}.old"; \
		if [ -e $$FP ]; then \
			rm "$$FP"; \
			echo "$$FP deleted"; \
		fi; \
	done
