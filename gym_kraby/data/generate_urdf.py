#!/usr/bin/env python3
from jinja2 import Environment, FileSystemLoader
from math import sin, cos, pi

"""
Compile templates into URDF robot description
"""

templates = ["hexapod.urdf", "one_leg.urdf"]

loader = FileSystemLoader(searchpath="./src/")
env = Environment(loader=loader)

# Load and compile Jinja2 templates
for t in templates:
    template = env.get_template(t + ".j2")
    with open(t, "w") as f:
        f.write(template.render(sin=sin, cos=cos, pi=pi))

