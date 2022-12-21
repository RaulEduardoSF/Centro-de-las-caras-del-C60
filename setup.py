from setuptools import  setup, find_packages

setup(
    name='Math-Transforms',
    version='1.0',
    description='Un paquete con transformaciones utiles del Algebra Lineal',
    author='Raul Eduardo Santoy Flores',
    author_email='santoyraul@gmail.com',
    url='',
    packages=find_packages(),
    scripts=['test.py'],
    install_requires=[paquete.strip() 
                        for paquete in open("requirements.txt").readlines()]
)