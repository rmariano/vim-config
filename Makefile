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

.PHONY: dev-deploy
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

.PHONY: dirs
dirs:
	@mkdir -p $(DIRS)

.PHONY: flake8
flake8:
	make install_external \
		EURL=https://github.com/nvie/vim-flake8/archive/1.6.tar.gz \
		PNAME=flake8

.PHONY: fugitive
fugitive:
	make install_external \
		EURL=https://github.com/tpope/vim-fugitive/archive/v2.2.tar.gz \
		PNAME=fugitive

.PHONY: nerdtree
nerdtree:
	make install_external \
		EURL=https://github.com/scrooloose/nerdtree/archive/5.0.0.tar.gz \
		PNAME=nerdtree

# use: make install_external EURL=<external_url> PNAME=<package_name>
.PHONY: install_external
install_external: dirs
	@wget $(EURL) -O $(PACKAGES_DIR)/$(PNAME).tar.gz
	@tar -xzf $(PACKAGES_DIR)/$(PNAME).tar.gz -C $(PACKAGES_DIR)
	@rm $(PACKAGES_DIR)/$(PNAME).tar.gz

.PHONY: extras
extras: flake8 fugitive nerdtree

# make install BRANCH=<branch>
.PHONY: install
install: dirs
	echo "Getting files from $(REMOTELOC)"
	@wget -O $(HOME)/.vimrc $(REMOTELOC)/.vimrc
	@wget -O $(COLORS_DIR)/tromso.vim $(REMOTELOC)/colors/tromso.vim
	@wget -O $(SYNTAX_DIR)/python.vim $(REMOTELOC)/syntax/python.vim

.PHONY: changelog
changelog:
	@git log master.. --oneline --pretty=format:"   * %s"

# make release TAG=<tag>
.PHONY: release
release:
	git tag -a $(TAG) -m "Vim config $(TAG)"
