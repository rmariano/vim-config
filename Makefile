COLORS_DIR := $(HOME)/.vim/colors
SYNTAX_DIR := $(HOME)/.vim/syntax
PACKAGES_DIR := $(HOME)/.vim/pack/lplugins/start

DIRS = \
	   $(COLORS_DIR) \
	   $(SYNTAX_DIR) \
	   $(HOME)/.vim/autoload \
	   $(HOME)/.vim/plugin \
	   $(HOME)/.vim/ftplugin \
	   $(HOME)/.vim/after/ftplugin \
	   $(PACKAGES_DIR)

BRANCH := master
REPO_HOME := https://github.com/rmariano/vim-config
REPO_URL := https://raw.github.com/rmariano/vim-config
REMOTELOC := $(REPO_URL)/$(BRANCH)

SOURCE_COLORS := $(PWD)/colors/tromso.vim
TARGET_COLORS := $(COLORS_DIR)/tromso.vim

SOURCE_SYNTAX := $(PWD)/syntax/*.vim
TARGET_SYNTAX := $(SYNTAX_DIR)
PRECHANGELOG = prechangelog.rst
YELLOW := \e[93m
RED := \e[91m

all: install

.PHONY: dev-deploy
dev-deploy: dirs
	@echo "Symlinking files..."
	ln -sfn $(PWD)/.vimrc $(HOME)/.vimrc
	ln -sfn $(SOURCE_COLORS) $(TARGET_COLORS)
	ln -sfn $(SOURCE_SYNTAX) $(TARGET_SYNTAX)
	ln -sfn $(PWD)/after/ftplugin/*.vim $(HOME)/.vim/after/ftplugin/

.PHONY: deploy
deploy: clean dirs
	cp -f $(PWD)/.vimrc $(HOME)/.vimrc
	cp -f $(SOURCE_COLORS) $(TARGET_COLORS)
	cp -fa $(SOURCE_SYNTAX) $(TARGET_SYNTAX)
	cp -fa $(PWD)/after/ftplugin $(HOME)/.vim/after

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
	rm -fr /tmp/vimconfig && mkdir -p /tmp/vimconfig
	@wget -O /tmp/vimconfig/vimconfig.zip $(REPO_HOME)/archive/$(BRANCH).zip
	@unzip -d /tmp/vimconfig /tmp/vimconfig/vimconfig.zip
	@cd /tmp/vimconfig/vim-config-$(BRANCH) && make deploy && cd -

# make changelog TAG=<tag>
.PHONY: changelog
changelog:
	@echo "Change Log" >> $(PRECHANGELOG)
	@echo -e "==========\n" >> $(PRECHANGELOG)
	@echo "$(TAG) ($(shell date --rfc-3339=date))" >> $(PRECHANGELOG)
	@echo "-----------------" >> $(PRECHANGELOG)
	@git log --no-merges master.. --oneline --pretty=format:"* %s" >> $(PRECHANGELOG)
	@echo -ne "\n\n" >> $(PRECHANGELOG)
	@tail -n +4 changelog.rst >> $(PRECHANGELOG)
	@sed -i 's/\(" Version:\).*/\1 $(TAG)/g' $(PWD)/.vimrc
	@echo -e "$(RED)$(PRECHANGELOG) $(YELLOW)created. Adjust & review status before releasing!"

# make release TAG=<tag>
.PHONY: release
release: $(PRECHANGELOG)
	mv {pre,}changelog.rst
	git add .
	git commit -S -m "Release $(TAG)"
	git tag -s $(TAG)

.PHONY: clean
clean:
	rm -fr $(HOME)/.vimrc \
		$(TARGET_COLORS) \
		$(TARGET_SYNTAX) \
		$(HOME)/.vim/after/ftplugin
