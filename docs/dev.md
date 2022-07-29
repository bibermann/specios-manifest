## Notes

### German umlaut in headers

Headers with german umlaut characters
that are visible in the TOC for the current page
must have a reference without special characters like so:

```md
## Arbeits-Kapazitäten {#sec-implementation-work-capacities}
```

Then the HTML anchor will undertake this name 
and looks like `#sec-implementation-work-capacities`,
otherwise it will get `#arbeits-kapazit%C3%A4ten`
and then the highlighting in the TOC does not work when scrolling.

The implementation probably uses the scrollspy from bootstrap,
but I haven't found anything about this bug.
So we need to use this workaround.

## Resources

- https://github.com/rstudio/bookdown-demo
- https://bookdown.org/yihui/bookdown/html.html#bs4-book
    - https://pkgs.rstudio.com/bookdown/reference/bs4_book.html
        - https://github.com/rstudio/bookdown/blob/main/inst/templates/bs4_book.html
- https://pandoc.org/MANUAL.html
- https://pkgs.rstudio.com/bookdown
- Citation styles: https://www.zotero.org/styles/
