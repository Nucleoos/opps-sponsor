#!/usr/bin/env python
# -*- coding:utf-8 -*-

from setuptools import setup, find_packages

from opps import sponsor


install_requires = ["opps"]

classifiers = ["Development Status :: 4 - Beta",
               "Intended Audience :: Developers",
               "License :: OSI Approved :: MIT License",
               "Operating System :: OS Independent",
               "Framework :: Django",
               'Programming Language :: Python',
               "Programming Language :: Python :: 2.7",
               "Operating System :: OS Independent",
               "Topic :: Internet :: WWW/HTTP :: Dynamic Content",
               'Topic :: Software Development :: Libraries :: Python Modules']

try:
    long_description = open('README.md').read()
except:
    long_description = sponsor.__description__

setup(
    name='opps-sponsor',
    namespace_packages=['opps', 'opps.sponsor'],
    version=sponsor.__version__,
    description=sponsor.__description__,
    long_description=long_description,
    classifiers=classifiers,
    keywords='poll opps cms django apps magazines websites',
    author=sponsor.__author__,
    author_email=sponsor.__email__,
    url='http://oppsproject.org',
    download_url="https://github.com/yacows/opps-sponsor/tarball/master",
    license=sponsor.__license__,
    packages=find_packages(exclude=('doc', 'docs',)),
    package_dir={'opps': 'opps'},
    install_requires=install_requires,
)
