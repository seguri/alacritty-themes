#!/usr/bin/env python

import sys
import yaml
import toml
from pathlib import Path

def yaml2toml(yaml_data):
    """Convert YAML data to TOML"""
    data = yaml.safe_load(yaml_data)
    # Remove 'name' and 'author' fields
    if 'colors' in data:
        colors = data['colors']
        if 'name' in colors:
            del colors['name']
        if 'author' in colors:
            del colors['author']
    return toml.dumps(data)

def readyaml_writetoml(input_filename):
    """Read YAML from input file, convert to TOML, and write to output file."""
    with open(input_filename, "r") as file:
        yaml_data = file.read()

    toml_data = yaml2toml(yaml_data)

    output_filename = Path(input_filename).with_suffix('.toml')
    with open(output_filename, "w") as file:
        file.write(toml_data)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python yaml2toml.py <yaml_file>")
        sys.exit(1)
    readyaml_writetoml(sys.argv[1])

