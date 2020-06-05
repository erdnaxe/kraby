from setuptools import setup, find_packages

setup(
    name='gym_kraby',
    version='0.0.1',
    author='Alexandre Iooss',
    author_email='erdnaxe@crans.org',
    license='GPLv3',
    url='https://kraby.readthedocs.io/',
    install_requires=[
        'gym',
    ],
    #data_files=[
    #    ('share/gym_kraby', ['*.urdf', '*.stl'])
    #],
    packages=find_packages(),
    include_package_data=True,
)
