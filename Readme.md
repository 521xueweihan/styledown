Styledown
=========

Write maintainable CSS styleguides efficiently using a Markdown.
**[Example here][example]** made from [these sources][example source].

[![Example](https://cdn.rawgit.com/rstacruz/styledown/81a1d9c/examples/screenshot.png)][example]

[![Status](https://travis-ci.org/rstacruz/styledown.png?branch=master)](https://travis-ci.org/rstacruz/styledown)

Installation
------------

``` bash
$ npm install -g styledown
$ styledown --help
```

[![npm version](https://badge.fury.io/js/styledown.svg)](https://npmjs.org/package/styledown "View this project on npm")

[example]: http://cdn.rawgit.com/rstacruz/styledown/90b9219/examples/bootstrap/index.html
[example source]: https://github.com/rstacruz/styledown/tree/master/examples/bootstrap

How it works
------------

Styledown is made to work in most web development setups. It doesn't favor any 
framework or language or any preprocessor.

 * Document your CSS files with inline comments, or as a separate `.md` file.
 * Create a file with styleguide configuration (a CSS file with some comments).
 * Invoke `styledown *.css > styleguide.html`.
 * Enjoy your styleguide!

Quickstart guide
----------------

Here's a generic guide on getting started with Styledown on any project. We're
gonna assume that you're using Sass and that your project bundles all CSS files
into one file.

Let's assume that your files are in `css/`, and that your final styleguide will
be in `public/styleguide.html`.

```
                    Example setup

.----------------------.     .---------------------.
| css/                 |     |                     |
|   components/        |     |  public/            |
|     button.scss      | ==> |    styleguide.html  |
|     forms.scss       |     |                     |
|     whatever.scss    |     |                     |
'----------------------'     '---------------------'
```

#### Step 1: Document

Document your project's stylesheets with `/** ... */` comments.  Let's say this
is `css/components/your-component.scss`.

This is a Markdown block within a comment. The example blocks
are can be written as [Jade] or HTML.

The first line should be the name of the block being documented, ending in `:`.

```css
/**
 * Component name:
 * `.your-component-here` - documentation on what your
 * component is goes here. Markdown is encouraged.
 *
 *     @example
 *     div.your-component-here
 *       h3 Sample code
 *       p goes here
 */

.your-component-here {
  display: block;
  ...
}
```

#### Step 2: Configure

Create a file and call it something like `css/styledown/extras.css`. This will
define what's in the `<head>` of your styleguides (to link to the correct CSS/JS
files), and define the body template (the element with `sg-content` defines
where everything goes).

```css
/**
 * # Styleguide options
 *
 * ### Head
 *
 *     link(rel="stylesheet" href="/assets/application.css")
 *     link(rel='stylesheet' href='https://cdn.rawgit.com/rstacruz/styledown/v0.4.1/data/styledown.css')
 *     script(src='https://cdn.rawgit.com/rstacruz/styledown/v0.4.1/data/styledown.js')
 *
 * ### Body
 *
 *     h1 My Awesome Styleguides
 *     div#styleguides(sg-content)
 */
```

The first one (`application.css`) should point to your project's concatenated
stylesheets. The second and third one (`styledown.css` and `styledown.js`)
point to the default Styledown CSS/JS files.

Optional: if you would like to have the CSS and JS files in your project
instead of loaded via CDN, use:

```sh
$ styledown --css > styledown.css
$ styledown --js  > styledown.js
```

#### Step 3: Build

Invoke `styledown` to generate an HTML file. (Mkae sure that the extras.css is
passed on the end, since anything after the "Styleguide options" heading is ignored.)

```bash
$ styledown -i css/components/*.css css/styledown/*.css > public/styleguides.html
```

#### Enjoy!

Now open `public/styleguides.html` in your browser.

Usage
-----

Styledown generates `.html` styleguides. It can take CSS files or Markdown 
files.

__Inline CSS mode:__ Parses comments from CSS files. This is what happens when 
you pass .css, .sass, .scss, .less and .styl files.

```
$ mdextract *.css > styleguide.html
```

__Markdown mode:__ Takes a Markdown files.

```
$ mdextract styles.md > styleguide.html
```

Markdown format
---------------

All Markdown documents are also Styledown documents. That is, all of Markdown 
will work. Styledown implements a few extensions that helps you create 
styleguides.

__Example blocks:__ Write your CSS documentation with an `h3`, and a code block 
that begins with `@example`.

``` markdown
<!-- markdown.md (Markdown mode) -->
### Button

Create your buttons with a `.button` class.

    @example
    <a class="button">Button</a>
    <a class="button primary">Button</a>
```

``` css
<!-- style.css (Inline mode) -->
/**
 * Button:
 * Create your buttons with a `.button` class.
 * 
 *     @example
 *     <a class="button">Button</a>
 *     <a class="button primary">Button</a>
 */
```

__Jade examples:__ Jade is also supported. It's auto-detected for you when you 
want Jade or HTML. This allows you to write simpler example code.

``` markdown
<!-- markdown.md (Markdown mode) -->
### Tables

`.table` - tables are styled nicely for you. Just add the class `.table`.

    @example
    table.table
      tr
        td Item 1
        td Item 2
        td Item 3
```

``` css
<!-- style.css (Inline mode) -->
/**
 * Tables:
 * `.table` - tables are styled nicely for you. Just add the class `.table`.
 * 
 *     @example
 *     table.table
 *       tr
 *         td Item 1
 *         td Item 2
 *         td Item 3
 */
```

Thanks
------

**Styledown** © 2013+, Rico Sta. Cruz. Released under the [MIT License].<br>
Authored and maintained by Rico Sta. Cruz with help from [contributors].

> [ricostacruz.com](http://ricostacruz.com) &nbsp;&middot;&nbsp;
> GitHub [@rstacruz](https://github.com/rstacruz) &nbsp;&middot;&nbsp;
> Twitter [@rstacruz](https://twitter.com/rstacruz)

[MIT License]: http://mit-license.org/
[contributors]: http://github.com/rstacruz/styledown/contributors
[highlight.js]: http://highlightjs.org/
[Jade]: http://jade-lang.com/
