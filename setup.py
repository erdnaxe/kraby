from setuptools import setup

# read the contents of your README file
from os import path
this_directory = path.abspath(path.dirname(__file__))
with open(path.join(this_directory, 'README.md'), encoding='utf-8') as f:
    long_description = f.read()

setup(
    name='gym_kraby',
    author='Alexandre Iooss',
    author_email='erdnaxe@crans.org',
    license='GPLv3',
    url='https://kraby.readthedocs.io/',
    long_description=long_description,
    long_description_content_type='text/markdown',
    install_requires=[
        'gym',
        'pybullet',
    ],
    packages=['gym_kraby'],
    package_data = {
        # Include URDF and associated STL
        'gym_kraby': ['data/*.urdf', 'data/meshes/*.stl'],
    },
    include_package_data=True,
    use_scm_version = {
        "local_scheme": "no-local-version"
    },
    setup_requires=['setuptools_scm'],
    classifiers=[
        'Programming Language :: Python',
    ],
)
