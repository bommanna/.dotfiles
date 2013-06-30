# List of commands
# ================
#
# * install
# 	installation
#
# * update
# 	update the git submodules
#
# * uninstall
# 	restore previous dotfiles
#		
# * brew
# 	install important brew formulae
#
# Subcommands
#
# * save
# 	copy all files that would be overwritten by linking
# 	into $CURDIR/.save/ . only non symbolic links
# 	are saved. later saves that might overwrite
# 	previous ones will raise an error
#
# * clean
#	removes all symbolic links that correspond to tracked
#	files here
#
# * link
# 	create symlinks for the relevant files in this directory
# 	from $HOME
#
# * create
# 	creates the directories necessary for the makefile to work
# 	(~/.config, .save/, .save/.config/)
#
# * restore
# 	will restore previous dotfiles (keeping any non overlapping
# 	ones in place)

FILES = .vim .bash_profile .bashrc .editrc .inputrc .tmux.conf .vimrc .ctags .ackrc
CONFIG_FOLDERS = git

install: create save clean link update

uninstall: clean restore

update:
	@echo 'Updating submodules...'
	git submodule update --init

brew:
	brew install tmux
	brew install ctags
	brew install ack
	brew install python
	brew install vim

create:
	@if [ ! -d "$(HOME)/.config" ]; then \
		echo "Creating .config directory"; \
		mkdir "$(HOME)/.config"; \
	fi;
	@if [ ! -d  .save ]; then \
		echo "Save directory created at $(CURDIR)/.save"; \
		mkdir .save; \
		mkdir .save/.config; \
	fi;

save:
	@echo 'Saving old dotfiles...'
	@for i in $(FILES); do \
		FP="$(HOME)/$$i"; \
		if [ ! -h $$FP ] && [ -e $$FP ]; then \
			echo "$$i -> .save/$$i"; \
			mv "$$FP" ".save/$$i"; \
		fi; \
	done;
	@for j in $(CONFIG_FOLDERS); do \
		FP="$(HOME)/.config/$$j"; \
		if [ ! -h $$FP ] && [ -e $$FP ]; then \
			echo ".config/$$j -> .save/.config/$$j"; \
			mv "$$FP" ".save/.config/$$j"; \
		fi; \
	done;

clean:
	@echo 'Cleaning up...'
	@for i in $(FILES); do \
		FP="$(HOME)/$$i"; \
		if [ -h $$FP ]; then \
			rm "$$FP"; \
			echo "$$FP deleted"; \
		fi; \
	done;
	@for i in $(CONFIG_FOLDERS); do \
		FP="$(HOME)/.config/$$i"; \
		if [ -h $$FP ]; then \
			rm "$$FP"; \
			echo "$$FP deleted"; \
		fi; \
	done;

link:
	@echo 'Creating new symlinks...'
	@for i in $(FILES); do \
		SP="$(HOME)/$$i"; \
		DP="$(CURDIR)/$$i"; \
		ln -s $$DP $$SP; \
		echo "$$SP symlink created"; \
	done
	@for i in $(CONFIG_FOLDERS); do \
		SP="$(HOME)/.config/$$i"; \
		DP="$(CURDIR)/.config/$$i"; \
		ln -s $$DP $$SP; \
		echo "$$SP symlink created"; \
	done

restore:
	@echo 'Restoring dotfiles...'
	@for i in $(FILES); do \
		SP=".save/$$i"; \
		DP="$(HOME)/$$i"; \
		if [ -e $$SP ]; then \
			if [ -h $$DP ]; then \
				rm "$$DP"; \
			fi; \
			mv "$$SP" "$$DP"; \
			echo "$$DP restored"; \
		fi; \
	done;
	@for i in $(CONFIG_FOLDERS); do \
		SP=".save/.config/$$i"; \
		DP="$(HOME)/.config/$$i"; \
		if [ -e $$SP ]; then \
			if [ -h $$DP ]; then \
				rm "$$DP"; \
			fi; \
			mv "$$SP" "$$DP"; \
			echo "$$DP restored"; \
		fi; \
	done;
