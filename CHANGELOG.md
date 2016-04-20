# Change Log

All notable changes to this project will be documented in this file.
We follow the [Semantic Versioning 2.0.0](http://semver.org/) format.


# 2.0.2 - March 20, 2016

### Added
- Added styles for skip-nav link

### Fixed
- Menu background now extends all the way to the edge on sites using older
  versions of cf-grid/cf-layout.


# 2.0.1 - March 7, 2016

### Changed
- Updated to latest header and footer CSS from cfgov-refresh.


## 2.0.0 - March 6, 2016

### Added
- Support for including the cfgov-refresh header and footer via `global_include`
  in the HTML templates and building the necessary CSS and JS,
  which is checked in in the `static/` folder.

### Removed
- The Nemo shim.


## 1.0.0 - January 6, 2016

### Added
- `package.json` for npm publishing support


## 0.3.1 - December 1, 2015

### Fixed
- `bower.json` cleaned up so that it doesn't ignore everything anymore.


## 0.3.0 - November 18, 2015

### Added
- Link to Planning for Retirement in Nemo shim nav
- `sidenav.html` now supports second-level navigation items

### Changed
- Updated to latest recruiting comment at the top of the page

### Removed
- Google Analytics snippet; we're all Google Tag Manager, all the time, now
- An extraneous file

### Fixed
- Typos in social media links
- Static asset links in `base.html` now use the `url_for` function for
  smarter path resolution
- Path to html5shiv


## 0.2.3 - April 27, 2015

### Added
- `nemo_subnav.html` include to `include_footer` block, without which the
  Nemo dropdown navigation would not work. :flushed:


## 0.2.2 - April 27, 2015

### Added
- JS needed for Nemo bits.


## 0.2.1 - April 27, 2015

### Changed
- Changes CSS and JS blocks in `base.html` to make it possible to
  override the defaults, if necessary.
  Instructions added for using the super function to extend a block.


## 0.2.0 – April 23, 2015

Project Clownfish, Part 1

The first commit in a project to make this into a Bower component that
can be imported into any cf.gov project.

### Added
- Adds `_includes` folder and splits template files between that and
  `_layouts` according to the philosophy established by cfgov-refresh.
- Brings in the Nemo bridge template files and Less from owning-a-home.
- Brings in the suite of layouts and new macros from cfgov-refresh.
- Adds a `bower.json` file.


## v0.1.1 – June 11, 2014

- Add more blocks to override things in the base template.
- Create a file to hold macros; pull out Twitter share URL generator into that.


## v0.1.0 – June 10, 2014

- Stand up repo with `_layouts` folder and standard meta documentation.
