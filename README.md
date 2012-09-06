CNERG Documentation
====================

The ``master`` branch of these files are used by Sphinx to generate
the CNERG home page.

The ``stub`` branch of these files can be used to spawn a new Sphinx
project with all of the same settings.

Best practice for rebuilding the site
=====================================

1. Only make changes to the ``.rst`` files in ``source`` and below
2. Rebuild a local copy of the site by running ``make html`` in the
   top level directory
3. Open the local copy of the html in your browser.  Note the UW 
   crest and other images may not process correctly on your local
   copy
4. When satisfied with the changes, commit them in 2 steps
      a. git add/commit only the files in ``source`` and below
      b. git add/commit all other files
   This will allow a cleaner review of the changes since only the
   first commit is non-automatically generated.
5. Push your changes back to the origin: **Be sure to fetch/merge
    the upstream changes and resolve conflicts!**