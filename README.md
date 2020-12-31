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

prompt%> docker pull cnerg/new-website-jekyll

prompt%> docker run -v $PWD:/new-website -p 4000:4000 -it cnerg/new-website-jekyll

docker-image-prompt%> cd /new-website

docker-image-prompt%> bundle exec jekyll server --host 0.0.0.0

```

You can then load the URL `localhost:4000/new-website` in a browser on your native system.

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

## Notes

* Twitter timeline embedded successfully on GH pages thanks to: https://github.com/liquid-utilities/twitter-timeline