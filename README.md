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
(as of April 2015) consumerfinance.gov header, navigation and footer,
adapted to have basic responsiveness.

Styles for these are found in `nemo.less` and `nemo-shim.less`.

#### `sidebar_nav.html`

This file sets up a left-hand navigation sidebar based on the designs modeled
by [cfgov-refresh](https://github.com/cfpb/cfgov-refresh).

[See below](#using-sidebar-navigation) for further instructions.

#### `macros.html`

Stores macros that can be called in templates.
Imported into `base.html` so that it's available everywhere.


## How to use these

Coming soon: getting started instructions.


### Using sidebar navigation

To activate the sidebar navigation, edit the `nav_items` variable in the
`sidebar_nav.html` file.
Each item has three components: the path, an ID for the item, and the link text.

Use this example from the Owning a Home project to guide you:

```jinja
{% set nav_items = [
    ('../', 'index', 'Owning a Home'),
    ('../check-rates/', 'check-rates', 'Check interest rates'),
    ('../loan-options/', 'loan-options', 'Understand loan options'),
    ('../process/', 'process', 'Know the process'),
    ('../prepare-worksheets/', 'prepare-worksheets', 'Preparation worksheets'),
    ('../resources/checklist_mortgage_closing.pdf', 'closing-checklist', 'Closing checklist'),
    ('../resources/mortgage_closing_forms.pdf', 'closing-forms', 'Closing forms explainer')
] -%}
```

On each page, set the `active_page` variable to enable highlighting the current
page in the sidebar.

```jinja
{% set active_page = 'loan-options' -%}
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
