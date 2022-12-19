# No root-relative links

This action scans a collection of source files (HTML and Markdown, primarily)
that will be ingested by a static-site generator (such as Jekyll, Hugo, or 11ty)
to find any links that are root-relative (i.e., links that begin with `/`).
Root-relative links can become broken during deployment if a site isn't deployed
to the root of its server. It is a good practice to prefix root-relative links
with something like `{{ site.baseurl }}` (in Jekyll) that is defined at
build-time so links will be relative to the site's actual deployed path.

If this action finds any root-relative links, it will create an annotation for
the file and line where the link is.

## Usage

```yaml
- uses: mgwalker/action-no-root-relative-links@v1
  with:
    # The path in your repository to scan for source files. In order to ensure
    # this path is present, be sure to checkout the repository before running
    # this action. Defaults to "."
    path: "_pages"

    # The message to include in annotation error messages. Defaults to "This
    # internal link is root-relative and should be prefixed."
    message: "Your message goes here"
```
