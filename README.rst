pl-mriconvertpower9
================================

.. image:: https://badge.fury.io/py/mriconvertpower9.svg
    :target: https://badge.fury.io/py/mriconvertpower9

.. image:: https://travis-ci.org/FNNDSC/mriconvertpower9.svg?branch=master
    :target: https://travis-ci.org/FNNDSC/mriconvertpower9

.. image:: https://img.shields.io/badge/python-3.5%2B-blue.svg
    :target: https://badge.fury.io/py/pl-mriconvertpower9

.. contents:: Table of Contents


Abstract
--------

FreeSurfer's mriconvert on Power9


Synopsis
--------

.. code::

    python mriconvertpower9.py                                           \
        [-v <level>] [--verbosity <level>]                          \
        [--version]                                                 \
        [--man]                                                     \
        [--meta]                                                    \
        <inputDir>
        <outputDir> 

Description
-----------

``mriconvertpower9.py`` is a ChRIS-based application that...

Agruments
---------

.. code::

    [-v <level>] [--verbosity <level>]
    Verbosity level for app. Not used currently.

    [--version]
    If specified, print version number. 
    
    [--man]
    If specified, print (this) man page.

    [--meta]
    If specified, print plugin meta data.


Run
----

This ``plugin`` can be run in two modes: natively as a python package or as a containerized docker image.

Using PyPI
~~~~~~~~~~

To run from PyPI, simply do a 

.. code:: bash

    pip install mriconvertpower9

and run with

.. code:: bash

    mriconvertpower9.py --man /tmp /tmp

to get inline help. The app should also understand being called with only two positional arguments

.. code:: bash

    mriconvertpower9.py /some/input/directory /destination/directory


Using ``docker run``
~~~~~~~~~~~~~~~~~~~~

To run using ``docker``, be sure to assign an "input" directory to ``/incoming`` and an output directory to ``/outgoing``. *Make sure that the* ``$(pwd)/out`` *directory is world writable!*

Now, prefix all calls with 

.. code:: bash

    docker run --rm -v $(pwd)/out:/outgoing                             \
            fnndsc/pl-mriconvertpower9 mriconvertpower9.py                        \

Thus, getting inline help is:

.. code:: bash

    mkdir in out && chmod 777 out
    docker run --rm -v $(pwd)/in:/incoming -v $(pwd)/out:/outgoing      \
            fnndsc/pl-mriconvertpower9 mriconvertpower9.py                        \
            --man                                                       \
            /incoming /outgoing

Examples
--------





