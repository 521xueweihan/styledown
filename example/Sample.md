Fancy style guide
=================

Buttons
-------

Add a class of `.button` to a `<button>` or `<a>` element, and use a size 
modifier (small, large, etc) and an appearance modifier (primary, success).

### Normal button

Use the `.button` class.

    a.button Confirm
    a.button.primary Success

### Button sizes

Use the `.button` class.

    a.button.small Confirm
    br
    a.button.large Success

Tables
------

### Simple table

Use `.table` on a table.

    table.table
      tr
        th One
        th Two
        th Three
      tr
        td Hello there
        td World
        td Yes

Forms
-----

Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod
tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At
vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,
no sea takimata sanctus est Lorem ipsum dolor sit amet.

### Radio buttons

Vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,
no sea takimata sanctus est Lorem ipsum dolor sit amet.

    <!--* white padded -->
    form.form
      label.radio
        input(type='radio')
        span Radio button 1
      br

      label.radio
        input(type='radio')
        span Radio button 2

<!--* global show-html toc -->
<link rel="stylesheet" href="mystyles.css">
