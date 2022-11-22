# Main game file
FILE = game.py

# Colors:
RED    := $(shell tput -Txterm setaf 1)
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
RESET  := $(shell tput -Txterm sgr0)

define print_headline
	@echo ""
	@echo "${YELLOW}*** $(1) *** ${RESET}"
	@echo ""
endef

define print_pass
	@echo "${GREEN}*** $(1) *** ${RESET}"
endef

setup-dev-env3: requirements.txt ##@Environment Creates a new python 3 virtual environment
	$(call print_headline,"Creating python 3.5 virtual environment")
	virtualenv -p /usr/bin/python3 env3
	. ./env3/bin/activate &&\
	sudo apt-get install python3-tk &&\
	pip install -r requirements.txt
	$(call print_pass,"Activate the virtual environment using: 'source ./env3/bin/activate'")

clean: ##@Environment Cleans up the development environment. 
	$(call print_headline,"Cleaning up the pyc files")
	find . -name "*.pyc" -print0 | xargs -0 rm -rf
	rm -rf dist build
	find . -type d -name __pycache__ -exec rm -rf {} + 
	find . -type d -name .cache -exec rm -rf {} + 

install:
	@if [ "x${ENV}" = "x" ]; then echo "Virtual environment is not set, exiting"; exit 1; fi
	pyinstaller --onefile $(FILE)
	rm -rf game.spec
	