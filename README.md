# Tips on maintaining this website

This website uses [Jekyll](https://jekyllrb.com/) to automatically render a combination of HTML and Markdown pages.

The final rendering is based on a combination of the following:
* content in individual Markdown or HTML files
* data in structured data files that is processed onto pages
* layout templates
* CSS for style

For any given page, there should be a Markdown or HTML page in the repository
that forms the basis of that page.  At the top of the file, there will be
metadata that helps understand how that page is rendered.  Most important is the
`layout` tag which indicates the layout file that is used to render that page.

In it's simplest form, the layout file will simply convert the markdown to HTML
and render it as is.  More complex layout files will process data into rendered
HTML.  

For example, the [file that lists skills in the
manual](community/manual/skills.md) uses the `desc_list` template to process
data from a file.  The data file is specified using the `data` tag, and its data
is processed into an HTML description list with an optional list of links.  The
layout file uses CSS tags to invoke different styles that are applied
universally across the site, and included from a hierarchy of CSS files.

In order to edit this file, you can:
 * edit the content in the file itself: `community/manual/skills.md`
 * edit the `desc_list` layout file: `_layouts/desc_list.html`
 * edit the data in the data file: `_data/skilss.yml`
 * (advanced) edit the CSS style files: `_sass/_variables.scss` or
   `_sass/_bootstrap_customization.scss` 

## Local testing of file rendering

In order to test the rendering of the files, you can run a local Jekyll server
using a docker image.

```
prompt%> cd <path-to-new-website-repo>

prompt%> docker run --rm --volume="$PWD:/srv/jekyll" --volume="$PWD/vendor/bundle:/usr/local/bundle" -p 4000:4000  jekyll/jekyll  jekyll serve

```

This will launch a local server that will constantly monitor the files and
re-render them each time the files change.  It may take some time to install
jekyll's internal dependencies.  (see
[here](https://github.com/envygeeks/jekyll-docker) for more.)

You can then load the URL `localhost:4000` in a browser on your native system.

# Add yourself to the CNERG website

1. Before you start:
  * If you are not familiar with git and version control, consider [this tutorial](http://swcarpentry.github.io/git-novice/)
  * Make sure you already have git installed on your computer
  * You may also want to refer to [this summary of git workflows](https://docs.google.com/presentation/d/1zWa5y-BUZVvR0jKCtG6ueDxPYoODKTP8xeyhZYP_eGo/edit#slide=id.g93ff427fad_0_0)
  * Create a [github](https://github.com/join) account, if you don’t already have one.

2. Clone a copy of the CNERG website repository

    a. Fork [the CNERG website
      repository](https://github.com/cnerg/cnerg.github.com). This can be done
      by clicking the “Fork” button in the top-right corner. Forking means you have
      your own version of the repository where you can make changes that won’t be
      reflected in the main repository.

    b. Clone your fork. This will download your fork to a directory on your local machine.
    
      ```
      git clone https://github.com/<github_username>/cnerg.github.com
      ```

    c. Move into the newly created cnerg.github.com folder

      ```
      cd cnerg.github.com
      ```

3. Make a branch to isolate the changes

    a. Create a new branch where you will make the changes. (It doesn’t have to be called “add_myself”, that’s just an example.)

      ```
      git branch add_myself
      ```

    b. Switch to your new branch.
      ```
      git checkout add_myself
      ```

    c. Note that steps 4 and 5 can be completed simultaneously with
      ```
      git checkout -b add_myself
      ```

4. Add the Data/Files for your Page

    a. Descend into the `community/people` directory and make a directory for yourself (mkdir <initials>). Most people use initials, but you can use anything that is unique
    ```
    cd community/people
    mkdir <initials>
    ```

    b. Change to that directory
    c. Add a photo of yourself by copying a file into this directory 
    ```
    cp <path to image> .
    ```

    c. Add an `index.md` file - it’s easiest to copy one from someone else. Either 
    ```
    touch index.md
    ```
    or
    ```
    cp <path to someone elses index.md> .
    ```

    c. Edit the `index.md` file by changing the data in the header
        * You can delete any that are not relevant
        * Make sure the `image` data refers to the photo you have copied in to this directory

5. Add Your Data to the Site Data

    a. Descend into the `_data` directory
      ```
      cd ../../../_data
      ```
      and edit `people.yml`

    b. Create an entry for yourself in the correct group - it’s easiest to just copy someone else’s entry 
    c. Update the data for you
        * The url should be the name of the directory you created above
        * The image should be the name of the file you copied into that directory above 

6. Test Your Addition

    a. You can test your addition by running the docker image referenced in the README:
    ```
	  cd <path-to-website-repo>
    ``` 
    (e.g. `cd ..` if in the `_data` directory)

    ```
    docker run --rm --volume="${PWD}:/srv/jekyll" --volume="${PWD}/vendor/bundle:/usr/local/bundle" -p 4000:4000 jekyll/jekyll jekyll serve
    ```


    b. Review your changes in a web browser at `localhost:4000`. If you make a change, you can refresh the browser and it should auto update (a few seconds after you save the changes)

7. Save your changes

    a. Once you feel it looks correct and the way you want it, add and commit your changes. This will save your changes to your local clone of your fork.
    ```
    git add <new_or_modified_files>
    git commit -m “Added <my_name>”
    ```

    It is often very useful to use `git status`, which will give you information like which files have been modified but are not staged for commit, which files have been modified and have been staged for commit (i.e. they have been `git add`ed), and whether you have commits in your clone that are not yet reflected in your github fork or vice versa.

    b. Push your new branch to your github fork.
    ```
    git push -u origin add_myself
    ```

    If your fork already contains the branch and you are only updating it with new commits, then git push by itself is sufficient.

8. Request that your changes be added to the official website

    a. Create a pull request (PR) between the branch on your fork and the “source” branch in the main repo. This can be done by using a web browser to navigate to your new branch on your fork and clicking “Pull request”.

    It will probably look like this:


    But you may need to go through the “Contribute” menu to start a PR:


    NOTE: you must be on the new branch for the contribute menu to pop up with a PR
	  (step 1 in the picture)

    This will allow other users to review the changes you made and make comments, request changes, or approve your changes. Once your PR has been created, you should be able to see it [here](https://github.com/cnerg/cnerg.github.com/pulls).

    b. Once you and one or more reviewers are satisfied with your changes, someone with write access will merge your branch into the main repo. This only updates the .rst files; it doesn’t update the rendered html. Someone will also need to regenerate the rendered .html before your changes will be reflected in the actual website.

    c. Once this is done, you’ll be able to find yourself on [the staff and students](https://cnerg.github.io/community/people/) page of the website!

# Boostrap 4 Github Pages

[![Build Status](https://travis-ci.org/nicolas-van/bootstrap-4-github-pages.svg?branch=master)](https://travis-ci.org/nicolas-van/bootstrap-4-github-pages)

A [Bootstrap 4](https://getbootstrap.com/) start up project for [Github Pages](https://pages.github.com/) and [Jekyll](https://jekyllrb.com/).

* A full Bootstrap 4 theme usable both on Github Pages and with a standalone Jekyll.
* Recompiles Bootstrap from SCSS files, which allows to customize Bootstrap's variables and use Bootstrap themes.
* Full support of Bootstrap's JavaScript plugins.
* Supports all features of Github Pages and Jekyll.

[See the website for demonstration and documentation](https://nicolas-van.github.io/bootstrap-4-github-pages/).

## Contribution

[See the contribution guide.](./CONTRIBUTING.md)

## License

[See the license file.](./LICENSE.md)

