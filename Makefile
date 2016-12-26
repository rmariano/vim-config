COLORS_DIR := $(HOME)/.vim/colors
SYNTAX_DIR := $(HOME)/.vim/syntax
PACKAGES_DIR := $(HOME)/.vim/pack/lplugins/start

DIRS = \
	   $(COLORS_DIR) \
	   $(SYNTAX_DIR) \
	   $(HOME)/.vim/autoload \
	   $(HOME)/.vim/plugin \
	   $(HOME)/.vim/ftplugin \
	   $(PACKAGES_DIR)

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
	ln -sfn $(PWD)/colors/tromso.vim $(COLORS_DIR)/tromso.vim
	ln -sfn $(PWD)/syntax/python.vim $(SYNTAX_DIR)/python.vim

dirs:
	@mkdir -p $(DIRS)

flake8:
	$(eval WHEREFLAKE8 := $(shell echo "https://raw.githubusercontent.com/nvie/vim-flake8/master"))
	@echo "Installing flake8..."
	@pip install --user flake8
	@echo "Downloading Vim flake8 from $(WHEREFLAKE8)"
	@wget -N $(WHEREFLAKE8)/autoload/flake8.vim --directory-prefix=$(HOME)/.vim/autoload/
	@wget -N $(WHEREFLAKE8)/ftplugin/python_flake8.vim --directory-prefix=$(HOME)/.vim/ftplugin/

fugitive: dirs
	@wget https://raw.githubusercontent.com/tpope/vim-fugitive/master/plugin/fugitive.vim --directory-prefix=$(HOME)/.vim/plugin/

nerdtree: dirs
	make install_external \
		EURL=https://github.com/scrooloose/nerdtree/archive/5.0.0.tar.gz \
		PNAME=nerdtree

# use: make install_external EURL=<external_url> PNAME=<package_name>
install_external:
	@wget $(EURL) -O $(PACKAGES_DIR)/$(PNAME).tar.gz
	@tar -xzf $(PACKAGES_DIR)/$(PNAME).tar.gz -C $(PACKAGES_DIR)
	@rm $(PACKAGES_DIR)/$(PNAME).tar.gz

extras: flake8 fugitive nerdtree

# make install BRANCH=<branch>
install: dirs
	echo "Getting files from $(REMOTELOC)"
	@wget -O $(HOME)/.vimrc $(REMOTELOC)/.vimrc
	@wget -O $(COLORS_DIR)/tromso.vim $(REMOTELOC)/colors/tromso.vim
	@wget -O $(SYNTAX_DIR)/python.vim $(REMOTELOC)/syntax/python.vim

changelog:
	@git log master.. --oneline --pretty=format:"   * %s"

# make release TAG=<tag>
release:
	git tag -a $(TAG) -m "Vim config $(TAG)"


.PHONY: changelog release dirs
