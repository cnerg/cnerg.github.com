CNERG Documentation

The ``stub`` branch of these files can be used to spawn a new Sphinx
project with all of the same settings.

In the top-level working copy directory of your git clone, assuming
it is called ``cnerg.github.com`` do the following:
::
     prompt %> cd ..
     prompt %> export NEWPROJDIR=<path/to/new/project/directory>
     prompt %> cp -a cnerg.github.com $NEWPROJDIR
     prompt %> cd $NEWPROJDIR
     
and edit ``source/cnerg-conf.py`` appropriately.

