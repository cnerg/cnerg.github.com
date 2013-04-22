Hardware & Software Infrastructure
-------------------------------------

CNERG has access to a modest collection of its own computing resources
with additional access to a growing collection of shared resources. 

Hardware
========

Desktop
~~~~~~~~

Each CNERG team member has a multi-core linux desktop workstation
managed by the `Computer Aided Engineering
<http://www.cae.wisc.edu/>`_ facility (CAE).  This provides a
standardized development environment and shared filespace.

Remote
~~~~~~~

* Under the same standardized CAE environment, we have access to two
  12-core (+ hyperthreading), 96 GB RAM compute servers.
* CNERG participates in a high-performance computing cluster with 320
  cores, each with either 2 GB or 4GB or RAM, managed by PBS for MPI
  jobs.
* As part of the UW `GLOW <http://research.cs.wisc.edu/condor/glow/>`_
  network, we have dedicated access to eight 10-core blades managed by
  Condor for serial jobs.
* As a participant in the `Center for High Throughput Computing
  <http://chtc.cs.wisc.edu/>`_, we have access to an additional 14,000
  cores managed by Condor for serial jobs.

Software 
========

The majority of our projects involve writing new software for
analyzing nuclear systems.  However, we do occasionally use software
developed by others and also rely on a number of different software
development tools.

+----------------------+---------------------+-------------------------------+---------------------+
| Radiation Transport  | Activation          |    Lattice Physics            | Reactor Analysis    |
+======================+=====================+===============================+=====================+ 
|MCNP5                 | ALARA               |    HELIOS                     |     PARCS           |
+----------------------+---------------------+-------------------------------+---------------------+
|Partisn               |                     |                               |     RELAP           |
+----------------------+---------------------+-------------------------------+---------------------+
|Denovo	               |                     |                               |                     |
+----------------------+---------------------+-------------------------------+---------------------+ 

+----------------------+---------------------+-------------------------------+---------------------+ 
|Compilers             | Debuggers/Profilers | Source Control & Documentation| Build Management    |
+======================+=====================+===============================+=====================+ 
|GNU C/C++/FORTRAN     |  gdb                | git                           |   autotools         |
+----------------------+---------------------+-------------------------------+---------------------+
|Portland Group        |  ddd                | svn                           |   cmake             |
+----------------------+---------------------+-------------------------------+---------------------+ 
|Intel	               | valgrind            | doxygen                       |                     |
+----------------------+---------------------+-------------------------------+---------------------+
|                      |                     |    sphinx                     |                     |
+----------------------+---------------------+-------------------------------+---------------------+

+----------------------+---------------------+-------------------------------+---------------------+
|Scripting & Automation|Visualization	     | Project Management	     |                     |
+======================+=====================+===============================+=====================+ 
|bash                  |   VisIt             |  Github                       |                     |
+----------------------+---------------------+-------------------------------+---------------------+ 
|Python                |    Paraview         |  Trac                         |                     |
+----------------------+---------------------+-------------------------------+---------------------+
|Perl                  |                     |                               |                     |
+----------------------+---------------------+-------------------------------+---------------------+

