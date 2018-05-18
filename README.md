# :warning: THIS REPO IS DEPRECATED (5/18/2018) :warning:

# cfgov-sheer-templates

This is a repository of base templates for consumerfinance.gov pages
served by the [Sheer](https://github.com/cfpb/sheer) engine.

This repo is currently housing templates that bridge the gap between the current
WordPress theme (cfpb_nemo) and future sitewide Sheer templates.

The hopeful, eventual end state of this repo is the single source for all
HTML, CSS, and JavaScript for sitewide use on consumerfinance.gov.


## What's in this repo?

### `_layouts`

Layouts pull together everything needed to display a whole page.

#### `base.html`

The base template on which all others are built. Includes:

```html
<html>
    {% import macros %}
    <head>
        <!-- Global meta -->
        <!-- Page-specific meta -->
        <!-- Global styles -->
        {% block additional_styles %}
        <!-- Global head scripts -->
        {% block head_scripts %}
    </head>
    <body>
        <!-- Analytics -->
        {% block body_top %}
        {% block include_header %}
        {% block content %}
        {% block include_footer %}
        {% block body_bottom %}
        <!-- Global body scripts -->
        {% block body_scripts %}
    </body>
</html>
```

### `_includes`

Includes are template partials and Jinja helpers.

#### `nemo_header.html`, `nemo_subnav.html`, and `nemo_footer.html`

Included in `base.html`, these files contain replicas of the current
(as of November 2015) consumerfinance.gov header, navigation and footer,
adapted to have basic responsiveness.

Styles for these are found in `nemo.less` and `nemo-shim.less`.

#### `secondary-navigation.html`

This file sets up a left-hand navigation sidebar based on the designs modeled
by [cfgov-refresh](https://github.com/cfpb/cfgov-refresh).

[See below](#using-sidebar-navigation) for further instructions.

#### `macros.html`

Stores macros that can be called in templates.
Imported into `base.html` so that it's available everywhere.


## How to use these

Coming soon: getting started instructions.


### Using sidebar navigation

To activate the sidebar secondary navigation, first create a `nav_items` variable
in a new include file in your project.
The recommended naming convention is `_vars-<projectname>.html`.
Each item has three components: the path, an ID for the item, and the link text.

Use this example from the FinEd Resources project to guide you:

```jinja
{% set nav_items = [
    ('/adult-financial-education/', 'adult-financial-education', 'Adult financial education'),
    ('/youth-financial-education/', 'youth-financial-education', 'Youth financial education'),
    ('/library-resources', 'library-resources', 'Resources for libraries'),
    ('/parents/', 'parents', 'Resources for parents'),
    ('/managing-someone-elses-money/', 'managing-someone-elses-money', 'Guides for managing someone else’s money'),
] -%}
```

On each page, after extending `layout-side-nav.html`,
set the `active_nav_id` variable to enable highlighting the current page,
and then import the `_vars` file you just created:

```jinja
{% set active_nav_id = 'library-resources' -%}
{% import '_vars-libraries.html' as libraries with context %}
```

You'll also want to grab the latest styles for the navigation component from
[the cfgov-refresh project](https://github.com/cfpb/cfgov-refresh/blob/flapjack/cfgov/unprocessed/css/nav-secondary.less)

**If you'd like to use two-level sidebar navigation,**
then for each parent nav item that will have children:

1. Add a fourth element, named `<parentitem>.children` to the parent item
   in the `nav_items` declaration, like so:

   ```jinja
   ('/library-resources', 'library-resources', 'Resources for libraries', libraries.children),
   ```
1. Add a line like this, above the `nav_items` declaration:

   ```jinja
   {% set libraries = { 'children': null } if not libraries else libraries %}
   ```
1. Create a `_vars-<parentitem>.html` file with a `children` declaration:

   ```jinja
   {% set children = [
       ('/library-resources/program-ideas/', 'program-ideas', 'Program ideas'),
       ('/library-resources/librarian-training/', 'librarian-training', 'Librarian training'),
       ('/library-resources/marketing-materials/', 'marketing-materials', 'Marketing materials'),
       ('/library-resources/websites-videos-courses/', 'websites-videos-courses', 'Websites, videos, and courses'),
   ] -%}
   ```
1. Import the new `_vars` file in the parent and its children,
   under the import of the main `_vars` file.
   Continuing with the Libraries example, the first four lines of our
   `library-resources/index.html` file now look like this:

   ```jinja
   {% extends 'layout-side-nav.html' %}
   {% set active_nav_id = 'library-resources' %}
   {% import '_vars-libraries.html' as libraries with context %}
   {% import '_vars-resources.html' as vars with context %}
   ```

_**Note:** Use of this navigation sidebar requires your project to have the
[cf-expandables](https://github.com/cfpb/cf-expandables) package available._


## Getting involved

We welcome your feedback and contributions.

- [Find out about contributing](CONTRIBUTING.md)
- [File a bug](https://github.com/cfpb/cfgov-sheer-templates/issues/new?body=%23%23%20URL%0D%0D%0D%23%23%20Actual%20Behavior%0D%0D%0D%23%23%20Expected%20Behavior%0D%0D%0D%23%23%20Steps%20to%20Reproduce%0D%0D%0D%23%23%20Screenshot&labels=bug)

### Known issues

- cfgov-refresh demo banner needs to be made optional


----

## Open source licensing info
1. [TERMS](TERMS.md)
2. [LICENSE](LICENSE)
3. [CFPB Source Code Policy](https://github.com/cfpb/source-code-policy/)


----

## Credits and references

1. [Jinja2 templating documentation](http://jinja.pocoo.org/docs/)
