define ASCILOGO
                                                                                            
                                                                   dddddddd                 
                                 tttt          lllllll             d::::::d                 
                              ttt:::t          l:::::l             d::::::d                 
                              t:::::t          l:::::l             d::::::d                 
                              t:::::t          l:::::l             d:::::d                  
   mmmmmmm    mmmmmmm   ttttttt:::::ttttttt     l::::l     ddddddddd:::::d    ooooooooooo   
 mm:::::::m  m:::::::mm t:::::::::::::::::t     l::::l   dd::::::::::::::d  oo:::::::::::oo 
m::::::::::mm::::::::::mt:::::::::::::::::t     l::::l  d::::::::::::::::d o:::::::::::::::o
m::::::::::::::::::::::mtttttt:::::::tttttt     l::::l d:::::::ddddd:::::d o:::::ooooo:::::o
m:::::mmm::::::mmm:::::m      t:::::t           l::::l d::::::d    d:::::d o::::o     o::::o
m::::m   m::::m   m::::m      t:::::t           l::::l d:::::d     d:::::d o::::o     o::::o
m::::m   m::::m   m::::m      t:::::t           l::::l d:::::d     d:::::d o::::o     o::::o
m::::m   m::::m   m::::m      t:::::t    tttttt l::::l d:::::d     d:::::d o::::o     o::::o
m::::m   m::::m   m::::m      t::::::tttt:::::tl::::::ld::::::ddddd::::::ddo:::::ooooo:::::o
m::::m   m::::m   m::::m      tt::::::::::::::tl::::::l d:::::::::::::::::do:::::::::::::::o
m::::m   m::::m   m::::m        tt:::::::::::ttl::::::l  d:::::::::ddd::::d oo:::::::::::oo 
mmmmmm   mmmmmm   mmmmmm          ttttttttttt  llllllll   ddddddddd   ddddd   ooooooooooo 
=============================================================================================

endef

export ASCILOGO

RED=\033[0;31m
GREEN=\033[0;32m
ORNG=\033[38;5;214m
BLUE=\033[38;5;81m
MAGENTA=\033[0;35;40m
NC=\033[0m

export RED
export GREEN
export NC
export ORNG
export BLUE
export MAGENTA

.PHONY: help install test

help:
	@printf "$$MAGENTA $$ASCILOGO $$NC\n"
	@printf "\033[21m\n\n"
	@printf "=======================================\n"
	@printf "\n"
	@printf "Primary Commands :\n"
	@printf "$$GREEN make install$$NC             Symlink dotfiles\n"
	@printf "$$GREEN make test$$NC                Run test scripts\n"
	@printf "\n"
	@printf "\033[21m\n\n"

install:
	./script/bootstrap force

test:
	@echo "Running tests"

# if this session isn't interactive, then we don't want to allocate a
# TTY, which would fail, but if it is interactive, we do want to attach
# so that the user can send e.g. ^C through.
INTERACTIVE := $(shell [ -t 0 ] && echo 1 || echo 0)
ifeq ($(INTERACTIVE), 1)
	DOCKER_FLAGS += -t
endif

shellcheck:
	docker run --rm -i $(DOCKER_FLAGS) \
		--name df-shellcheck \
		-v $(CURDIR):/usr/src:ro \
		--workdir /usr/src \
		r.j3ss.co/shellcheck ./test.sh
