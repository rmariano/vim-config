all:

changelog:
	@git log master.. --oneline --pretty=format:"   * %s"

# make release TAG=<tag>
release:
	git tag -a $(TAG) -m "Vim config $(TAG)"


.PHONY: changelog release
