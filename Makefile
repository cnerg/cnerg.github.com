# Makefile for Sphinx documentation 
#
GH_PAGES_SOURCES = source 
BUILT_DIRS = _static _sources build neutronics group fuelcycle
SOURCE_BRANCH = source
BUILD_BRANCH = master

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
PAPER         =
BUILDDIR      = ./build

# Internal variables.
PAPEROPT_a4     = -D latex_paper_size=a4
PAPEROPT_letter = -D latex_paper_size=letter
ALLSPHINXOPTS   = -d $(BUILDDIR)/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) source
# the i18n builder cannot share the environment and doctrees with the others
I18NSPHINXOPTS  = $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) source

.PHONY: help clean html dirhtml singlehtml pickle json htmlhelp qthelp devhelp epub latex latexpdf text man changes linkcheck doctest gettext


help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  gh-revert  to revert changes made to $(BUILD_BRANCH) branch and switch back to $(SOURCE_BRANCH)"
	@echo "  gh-push    to push HTML documentation in $(BUILD_BRANCH) branch"
	@echo "  html       to make standalone HTML files"

gh-revert:
	git checkout -f --
	rm -rf $(GH_PAGES_SOURCES) build
	git checkout $(SOURCE_BRANCH)

gh-push:
	rm -rf $(GH_PAGES_SOURCES) build
	git add -A 
	git commit -m "Generated $(BUILD_BRANCH) for `git log $(SOURCE_BRANCH) -1 --pretty=short --abbrev-commit`" && git push origin $(BUILD_BRANCH)
	git checkout $(SOURCE_BRANCH)


html:
	$(SPHINXBUILD) -b html $(ALLSPHINXOPTS) $(BUILDDIR)/html
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)."

clean:
	rm -rf $(BUILT_DIRS)

install:
	rsync -a $(BUILDDIR)/html/* .
	rm -rf $(BUILDDIR)/html/*
