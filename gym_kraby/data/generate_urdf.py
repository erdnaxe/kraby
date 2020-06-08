#!/usr/bin/env python3
from jinja2 import Environment, FileSystemLoader
from math import sin, cos, pi

"""
Compile templates into URDF robot description
"""

loader = FileSystemLoader(searchpath="./src/")
env = Environment(loader=loader)

# Load and compile Jinja2 template
template = env.get_template("hexapod.urdf.j2")
with open("hexapod.urdf", "w") as f:
    f.write(template.render(sin=sin, cos=cos, pi=pi))

