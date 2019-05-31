CNERG Documentation
====================

(Note: Sphinx versions higher than 1.1.2 are required.)

Documentation about adding a new person to the CNERG website can be found
[here](https://docs.google.com/document/d/1s8DR-TDpMsZ3Sl_vQJZDEtbrFVOfium1BRJlWVjeRig/edit).
It also contains some information on downloading and building the website.


A 2 branch system has been implemented to maintain a clean process of
rebuilding this site.

1. The `source` branch contains the restructured text documents and
Sphinx configuration used to build the site.  All direct editing of
files should be made in the `source` branch.

2. The `master` branch contains the processed and published web
content that is derived by Sphinx from the `source` branch.  These
files should not be editted directly.

It is now possible to
[automatically update the publication list from Zotero](zotero/README.md).


Best practice workflow for contributing to site changes
--------------------------------------------------------

1. Checkout the `source` branch

   ```git checkout source```

2. Synchronize your branch with the repository (either `pull` or
`fetch` and `merge`)

     ```git pull upstream```

3. Create a branch to contain your change

     ```git checkout -b add_some_info```

4. Make your changes in this branch

5. Test your changes by using the `gh-preview` target

     ```make gh-preview```

   This will build a version of the site in the `gh-build` directory of
   your branch, `add_some_info`.  You can load it directly in a local
   browser.

6. Repeat steps 4-5 until satisfied.

7. Once satisfied with the source RST files, push your branch to the
   repo.  Be sure to synchronize with any possible changes to the
   `source` branch first.

     ```
     git fetch upstream
     git rebase upstream/source
     git push upstream add_some_info
     ```

8. Issue a pull request by going to your branch on the repo and
   clicking the "Pull Request" button.

Best practice for managing a pull request
------------------------------------------

1. Synchronize your repository with the remote repo

     ```git fetch upstream```

2. Checkout the `pull_request_branch`

     ```git checkout -b pull_request_branch upstream/pull_request_branch```

3. Test the changes by using the `gh-preview` target

    ```make gh-preview```

   This will build a version of the site in the `gh-build` directory in
   your branch, `pull_request_branch`.  You can load it directly in a
   local browser.

5. If satisfied, merge the `pull_request_branch` into the `source`
   branch.  Be sure to synchronize with the remote repo first.

     ```
     git checkout source
     git fetch upstream
     git rebase upstream/source
     git merge pull_request_branch
     ```

6. If there are no conflicts, push this to the repo

     ```git push upstream source```

7. Republish the pages with the `gh-publish` target.

     ```make gh-publish```


Use docker to build and preview the website
--------------------------------------------
To build CNERG website using docker you can use the cnerg container containing
all the required dependencies to build the website
`cnerg/cnerg.github.io-deps`.
From the directory containing the website repository (if you don't have one yet
please clone it first):

1. run the docker container: 

    ```docker run -u $UID -v $PWD:/local_drive -it cnerg/cnerg.github.io-deps```

2. go into the mounted folder in docker: 
    ```cd /local_drive```

3. build a preview of the website: 
    ```make gh-preview```

4. quit docker: 
    ```exit```

5. preview your modified version of the website using your prefered web browser.

Use docker to publish the website
----------------------------------
To build CNERG website using docker you can use the cnerg container containing
all the required dependencies to build the website
`cnerg/cnerg.github.io-deps`.

This is separated into two steps since this is easier than making your git
config info available inside the docker container.

From the directory containing the website repository (if you don't have one yet
please clone it first):

1. run the docker container: 

    ```docker run -u $UID -v $PWD:/local_drive -it cnerg/cnerg.github.io-deps```

2. go into the mounted folder in docker: 
    ```cd /local_drive```

3. stage the updated website for publication
    ```make docker-gh-stage```

4. quit docker: 
    ```exit```

5. publish the updated website
     ```make docker-gh-push```

