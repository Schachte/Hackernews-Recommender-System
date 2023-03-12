# Makefile

# Define the name of the virtual environment
VENV_NAME := ml

# Define the name of the Python executable to use within the virtual environment
PYTHON := $(VENV_NAME)/bin/python

# Define the name of the requirements file
REQUIREMENTS := requirements.txt

# Define the name of the Jupyter Notebook file
NOTEBOOK := hn.ipynb

# Define the port number to use for Jupyter Notebook
PORT := 8081

# Run Jupyter Notebook
run:
	@echo "Starting Jupyter Notebook on port $(PORT) with notebook $(NOTEBOOK)"
	$(PYTHON) -m notebook --port $(PORT) $(NOTEBOOK)

# Create a virtual environment and install dependencies
venv:
	@echo "Creating virtual environment $(VENV_NAME) and installing dependencies from $(REQUIREMENTS)"
	python3 -m venv $(VENV_NAME)
	$(PYTHON) -m pip install --upgrade pip
	$(PYTHON) -m pip install -r $(REQUIREMENTS)

# Activate the virtual environment
activate:
	@echo "Activating virtual environment $(VENV_NAME)"
	( \
		. ml/bin/activate; \
	)

# Deactivate the virtual environment
deactivate:
	@echo "Deactivating virtual environment $(VENV_NAME)"
	deactivate

# Show help message
help:
	@echo "Usage: make [command]"
	@echo "Commands:"
	@echo "  venv           Create virtual environment and install dependencies"
	@echo "  activate       Activate virtual environment"
	@echo "  run            Start Jupyter Notebook on port $(PORT) with notebook $(NOTEBOOK)"
	@echo "  deactivate     Deactivate virtual environment"
	@echo "  help           Show this help message"

.PHONY: run venv activate deactivate help
