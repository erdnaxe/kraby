from setuptools import setup, find_packages

setup(
    name='gym_kraby',
    author='Alexandre Iooss',
    author_email='erdnaxe@crans.org',
    license='GPLv3',
    url='https://kraby.readthedocs.io/',
    install_requires=[
        'gym',
    ],
    packages=find_packages(),
    package_data = {
        # Include URDF and associated STL
        'gym_kraby': ['data/*.urdf', 'data/meshes/*.stl'],
    },
    include_package_data=True,
    use_scm_version=True,
    setup_requires=['setuptools_scm'],
)
