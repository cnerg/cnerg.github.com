.. toctree::
   :maxdepth: 1
   :hidden:

   funded
   spinoffprojects
   cvt

Research Areas
================

CNERG research lies at the middle of a continuum of computational
work, with pure methods development at one end and pure systems
analysis at the other.  CNERG’s goal is to help improve capability for
real analysis of complex systems by investigating and implementing new
methods in production software tools.  The primary product of our work
is a suite of technology to enable these analyses, although much of
our :doc:`funding <funded>` comes from analysis efforts.

While both areas deal with topics at the core of nuclear engineering,
the efforts of CNERG are divided between a neutronics_ group and a `fuel
cycle`_ group.

.. _neutronics:

Neutronics
----------

The cornerstone of the CNERG neutronics group's work is the Direct
Accelerated Geometry Monte Carlo (DAGMC_) toolkit.  This ray-tracing
interface to the MOAB_ software library allows Monte Carlo radiation
transport software to perform ray-tracing and related operations
directly on CAD-based representations of complex geometry.  DAGMC has
been successfully integrated with MCNP5 from Los Alamos National
Laboratory to produce the DAG-MCNP5 package.

Current research based on the DAGMC technology includes:

**DAGMC performance improvements using novel surface meshing
algorithms**: The benefit of the OBB-tree accelerations that are
vital to DAGMC's performance can be undermined by a faceting of the
CAD surfaces that produces vertices that are shared by too many
facets: so-called *high valence vertices*.  Different faceting
algorithms will be compared with some mesh cleanup algorithms to
identify schemes to arrive at a faceting that is better suited to
the OBB-tree acceleration scheme for challenging problems.

**Unstructured mesh tallies with alternative estimators**: With
complex geometry and 3-D source definitions now common-place, the
focus turns to the ability to tally results in Monte Carlo
simulations with better fidelity.  The Cartesian overlay mesh common
to most solutions introduces physical approximations for complex
geometry that does not align conveniently with such a grid.  This
work uses conformal unstructured mesh to define the tally mesh for a
traditional track-length estimator, and then explores alternative
estimators such as the kernel density estimator applied at mesh nodes
rather than across mesh elements.

**High-fidelity shutdown dose workflow for activated systems**: Known
as the *Rigorous-2-Step* method, or R2S, in fusion neutronics, this
workflow performs a multi-group spatially resolved neutron transport
calculation to determine neutron fluxes throughout the system, uses
those fluxes to determine the isotopic change in the activated
materials, and then samples the photon source that arises from that
activation to perform a detailed photon dose calculation at various
times after the shutdown of the neutron source.  The critical
research & development steps are the generation of material
definitions for Cartesian grid elements superimposed on a complex
geometry, and the efficient sampling of a grid-based multi-group
photon source.

**Hybrid deterministic-Monte Carlo workflow**: For nearly 2 decades,
the use of deterministic hybrid approaches to Monte Carlo variance
reduction have been explored and refined.  Extending this capability
to the CAD-based DAGMC transport problems requires the generation of
a mesh for use in the deterministic solution.  Leveraging the
improvements made for the R2S workflow above, this process should be
straightforward and allow most of the normal hybrid technology to be
applied directly to DAGMC-based problems.

In addition, students in this area often pursue :doc:`spin-off
projects <spinoffprojects>` through collaborations with national
laboratories.

.. _fuel cycle:

Fuel Cycle
-----------

The CNERG fuel cycle group's `Cyclus <http://cyclus.github.com>`_
project was recently selected as the base infrastructure for the
Department of Energy's Next-Generation Fuel Cycle Simulator.  This
project aims to address gaps in the available simulator tools by:

* modeling discrete facilities and material transactions
* using an agent-based approach with dynamically loadable plugins to
  encapsulate behavior
* open source development pratices to lower the barrier to adoption
* common physics infrastructure with alternative output layers for
  different user communities.

In addition to developing the `core technology`_ as a team, the following
research areas are also being pursued by individual CNERG members:

* geologic repository model (Cyder_) with plugin architecture for repository
  physics models
* application of social-behavioral models of individual agents to study
  :doc:`nuclear material diversion and proliferation issues <cvt>`.

.. _MOAB: http://sigma.mcs.anl.gov/moab-library/
.. _DAGMC: http://svalinn.github.com/DAGMC
.. _core technology: http://github.com/cyclus/cyclus
.. _Cyder: http://github.com/katyhuff/cyder
