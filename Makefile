DIRS = \
	   $(HOME)/.vim/colors \
	   $(HOME)/.vim/syntax \
	   $(HOME)/.vim/autoload \
	   $(HOME)/.vim/plugin \
	   $(HOME)/.vim/ftplugin
BRANCH := master
REPO_URL := https://raw.github.com/rmariano/vim-config
REMOTELOC := $(REPO_URL)/$(BRANCH)

all: install

dev-deploy:
	@echo "Symlinking files..."
	@for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".*.swp"); do \
		f=$$(basename $$file); \
		target=$(HOME)/$$f; \
		echo -e "\tLinking $$file -> $$target"; \
		ln -sfn $$file $$target; \
	done
	ln -sfn $(PWD)/colors/tromso.vim $(HOME)/.vim/colors/tromso.vim
	ln -sfn $(PWD)/syntax/python.vim $(HOME)/.vim/syntax/python.vim

dirs:
	@mkdir -p $(DIRS)

flake8:
	@echo "Installing flake8..."
	@pip install --user flake8
	@echo "Downloading Vim flake8.."
	@wget https://raw.githubusercontent.com/nvie/vim-flake8/master/autoload/flake8.vim --directory-prefix=$(HOME)/.vim/autoload/
    @wget https://raw.githubusercontent.com/nvie/vim-flake8/master/ftplugin/python_flake8.vim --directory-prefix=$(HOME)/.vim/ftplugin/

fugitive: dirs
	@wget https://raw.githubusercontent.com/tpope/vim-fugitive/master/plugin/fugitive.vim --directory-prefix=$(HOME)/.vim/plugin/

extras: flake8 fugitive

# make install BRANCH=<branch>
install: dirs
	@echo $(REMOTELOC)
	@wget -O $(HOME)/.vimrc $(REMOTELOC)/.vimrc
	@wget -O $(COLORS_DIR)/tromso.vim $(REMOTELOC)/colors/tromso.vim
	@wget -O $(SYNTAX_DIR)/python.vim $(REMOTELOC)/syntax/python.vim

changelog:
	@git log master.. --oneline --pretty=format:"   * %s"

# make release TAG=<tag>
release:
	git tag -a $(TAG) -m "Vim config $(TAG)"


.PHONY: changelog release dirs
