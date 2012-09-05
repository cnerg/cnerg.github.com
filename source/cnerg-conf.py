# -*- coding: utf-8 -*-
#
# UW-Madison Computational Nuclear Engineering Research Group (CNERG)
# documentation build configuration file extracts
#

# -- CNERG settings collected in one place --------------------------------------
# 
# Some of these may repeat entries above, but should overwrite them here
# All of these should be changed for each project

# General information about the project.
# CNERG-stub - change these
project = u'Long Project Name'
copyright = u'2012, UW CNERG Team'

# The version info for the project you're documenting, acts as replacement for
# |version| and |release|, also used in various other places throughout the
# built documents.
#
# CNERG-stub - change these
# The short X.Y version.
version = '0.1'
# The full version, including alpha/beta/rc tags.
release = '0.1'

html_theme_options = { 
'site_title' : u'CNERG Stub',
'tagline' : u'Stub settings for CNERG Sphinx projects'
}
html_title = 'CNERG Stub'

# CNERG Change: global replace LongProjectName (and variations) with a
# brief one line name of the project
# Output file base name for HTML help builder.
htmlhelp_basename = 'LongProjectNamedoc'

# -- Options for LaTeX output --------------------------------------------------

# Grouping the document tree into LaTeX files. List of tuples
# (source start file, target name, title, author, documentclass [howto/manual]).
latex_documents = [
  ('index', 'LongProjectName.tex', u'Long Project Name Documentation',
   u'UW CNERG Team', 'manual'),
]

# -- Options for manual page output --------------------------------------------

# One entry per manual page. List of tuples
# (source start file, name, description, authors, manual section).
man_pages = [
    ('index', 'longprojectname', u'Long Project Name Documentation',
     [u'UW CNERG Team'], 1)
]

# -- Options for Texinfo output ------------------------------------------------

# Grouping the document tree into Texinfo files. List of tuples
# (source start file, target name, title, author,
#  dir menu entry, description, category)
texinfo_documents = [
  ('index', 'LongProjectName', u'Long Project Name Documentation',
   u'UW CNERG Team', 'LongProjectName', 'One line description of project.',
   'Miscellaneous'),
]
