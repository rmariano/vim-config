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

SOURCE_COLORS := $(PWD)/colors/tromso.vim
TARGET_COLORS := $(COLORS_DIR)/tromso.vim

SOURCE_SYNTAX := $(PWD)/syntax/python.vim
TARGET_SYNTAX := $(SYNTAX_DIR)/python.vim

all: install

.PHONY: dev-deploy
dev-deploy:
	@echo "Symlinking files..."
	ln -sfn $(PWD)/.vimrc $(HOME)/.vimrc
	ln -sfn $(SOURCE_COLORS) $(TARGET_COLORS)
	ln -sfn $(SOURCE_SYNTAX) $(TARGET_SYNTAX)

.PHONY: deploy
deploy: dirs clean
	cp -f .vimrc $(HOME)/.vimrc
	cp -f $(SOURCE_COLORS) $(TARGET_COLORS)
	cp -f $(SOURCE_SYNTAX) $(TARGET_SYNTAX)

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
	@wget -O $(TARGET_COLORS) $(REMOTELOC)/colors/tromso.vim
	@wget -O $(TARGET_SYNTAX) $(REMOTELOC)/syntax/python.vim

.PHONY: changelog
changelog:
	@git log master.. --oneline --pretty=format:"   * %s"

# make release TAG=<tag>
.PHONY: release
release:
	git tag -a $(TAG) -m "Vim config $(TAG)"

.PHONY: clean
clean:
	rm -f $(HOME)/.vimrc $(TARGET_COLORS) $(TARGET_SYNTAX)
