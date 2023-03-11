#!/bin/bash

# Create a new virtualenv
virtualenv myenv
source myenv/bin/activate

# Install required packages
pip install numpy pandas matplotlib scikit-learn tensorflow torch seaborn jupyter

# Create a Jupyter kernel for the virtualenv
python -m ipykernel install --user --name=myenv

# Deactivate the virtualenv
deactivate
