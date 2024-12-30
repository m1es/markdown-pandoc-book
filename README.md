# Markdown Pandoc Book

This repository shows a Markdown to Pandoc flow to generate a simple book.

## Example

The result of running the Rake task generates [the PDF file](build/output.pdf) that can be found in the [build](build) folder.

## Usage

`rake book:generate`

Which by default looks for source files in [src/front](src/front) and [src/main](src/main)
and writes the PDF file to [build/output.pdf](build.output.pdf)

or run

`rake book:generate\[./src,book.pdf\]`

for using another input directory and/or output file.

## Pandoc

### Pandoc command

To change the Pandoc command, head over to [lib/book.rb](lib/book.rb) and modify it's contents.

### Front and main matter

Take a look at the [src](src) folder to get an idea on how to use the front and main matter.
In short:

- The front matter does not have page numbers
- There is a table of contents at the end of the front matter
- Use numbers, like `5-filename.txt` in front of your files to determine the order

## Dependencies

- [Ruby](https://www.ruby-lang.org/en/downloads/)
- [Pandoc](https://pandoc.org/installing.html)

The following Latex packages are required:

- collection-fontsrecommended
- sectsty

These packages can be installed by running:

- `tlmgr install collection-fontsrecommended`
- `tlmgr install sectsty`
