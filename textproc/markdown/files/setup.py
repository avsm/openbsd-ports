# $OpenBSD: setup.py,v 1.1.1.1 2006/10/09 16:01:25 alek Exp $

from distutils.core import setup

setup(
    name = 'markdown',
    version = '1.5',
    description = "Python implementation of Markdown.",
    author = "Manfred Stienstra and Yuri takhteyev",
    maintainer = "Yuri Takhteyev",
    maintainer_email = "yuri [at] freewisdom.org",
    url = "http://www.freewisdom.org/projects/python-markdown",
    py_modules = ["markdown",],

    ) 
