# consumerfinance.gov Sheer Templates

This is a repository of base templates for consumerfinance.gov pages
served by the [Sheer](https://github.com/rosskarchner/sheer) engine.

These templates are or will soon be in use on:
- [CF.gov Refresh](https://github.com/cfpb/cfgov-refresh)
- [Owning a Home](https://github.com/cfpb/owning-a-home)


## Intro to Sheer

Coming soon: what Sheer is, how its templating system works.


## What's in this repo?

### `_layouts`

#### `base.html`

The base template on which all others are built. Includes:

```html
<html>
    <head>
        <!-- Global meta -->
        <!-- Page-specific meta -->
        <!-- Styles -->
        <!-- Head scripts -->
    </head>
    <body>
        <!-- Analytics -->
        <!-- Twitter share URL building -->
        <!-- Demo banner -->
        {% include "header.html" %}
        {% block content %}
        {% include "footer.html" %}
        <!-- Body scripts -->
    </body>
</html>
```


## How to use these

Coming soon: getting started instructions.


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

1. [Jinja2 templating documentation]
