Software Development Workflow
=============================

.. note:: 

    It is highly recommended that you perform all of your work from inside 
    of a distributed version control system.  On this page, we will use 
    git as an example.

In a typical collaborative software development project (e.g. newk), 
there is often a central repository hosted somewhere.  For arguments sake let's
say this is on github and controlled by the newk organization.  This repository
will thus be available as http://github.com/newk/newk -- or newk/newk for short.

Different users will then have forks (copies) of this repository:

    http://github.com/me/newk or me/newk

    http://github.com/you/newk or you/newk

    http://github.com/other/newk or other/newk

So the question arises, **"What is the best way for us to exchange code?"**

By convention there is a hierarchy of branches.  Branches that are more important 
and more stable are touched less often while those which are used for day-to-day 
development are touched more frequently.  Branches often fall into one of the 
following categories, in order of decreasing importance:

1. **master:** This is the most stable branch and represents code that *definitely*
   works.  This branch should only be pushed to at release time.
2. **staging** or **develop:** This branch is the merge branch for all developers.
   It represents the place where reconciliation between various updates happen.
   As such, it is sort of a communal playground.  Everyone is there and things
   probably work but may not quite be ready for prime time.  At release time, 
   it is this branch which becomes merged with the master branch.
3. **topical:** These branches exist so that you may hack at will on implementing
   a feature or fix a bug.  There may be many of these simultaneously.  These
   branches are merged into develop.  Such branches are the wild west and nothing
   should be expected to work here.

All of the types of branches described above are present on all forks.

Reconciliation Workflow
-----------------------
Suppose that me and you are working on some hot feature on a special ``awesome``
topical branch.  There are two basic strategies for managing our branches.

**Strategies:**

a. We fetch from staging regularly, merge awesome against staging, 
   push to origin (e.g. me/newk or you/newk) and then pull request into 
   newk/newk.
b. Don't worry about staging updates on the awesome branch. Once awesome branch 
   features are ready to be moved into staging they will be merged against staging.

In general, the short answer is do (a).  The medium answer is that you should do 
what works best for you in that moment.  

The long answer is that experience in life (and software development) has shown 
that it is best to `"Fail early, fail often" 
<ttp://www.codinghorror.com/blog/2006/05/fail-early-fail-often.html>`_.  
This is because the sooner that you fail, the sooner you detect the mistake, 
and the less impact that mistake has in the code base overall.  Also failure is 
how you learn.  Furthermore, such failures are how you clarify exactly what a 
piece of code should be doing.  

By frequently merging the master, staging, and relevant topical branched from 
upstream (newk/newk) to your repository (you/newk) or from master to stanging and
staging to topical (awesome), you are ensuring that the code you are working on 
continues to function.  If something breaks, you can take care of it then in that 
moment while everything is still fresh in your mind.  By waiting to merge or rebase 
until a large feature is complete, you run the risk of true major catastrophic 
breakage.  These are difficult to recover from since it may have been months or 
years since the last merge.  It is better to trade this for daily smaller dosages 
of ho-hum failures. 

Now as to the exact frequency that you should be updating with, this is largely a
matter of personal preference and how active upstream development is.  I am commit 
happy personally.  Daily is my strategy, 3 days is reasonable, and weekly often used 
in corporate settings.  Longer than that and you fail to reap any benefits from 
strategy (a) and are *de facto* using strategy (b).
