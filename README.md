# Markdown Pandoc Book

This repository shows a Markdown to Pandoc flow to generate a simple book.

# Example

The result of running the rake task generates the PDF file that can be found in the `build` folder.

## Usage

`rake book:generate`

Which defaults to look for source files in `./src/front` and `./src/main`
and writes the PDF file to `./build/output.pdf`

or

`rake book:generate\[./src,book.pdf\]`

for changing the input directory and/or output file.

## Pandoc command

To change the Pandoc command, head over to `lib/book.rb` and modify it's contents.

## Front and main matter

Take a look at the `src` folder to get an idea on how to use the front and main matter.
In short:

- The front matter does not have page numbers
- There is a table of contents at the end of the front matter
- Use numbers, like `5-filename.txt` in front of your files to determine the order
