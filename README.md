# `resume` Document Class

LaTeX document class for writing a résumé or a curriculum vitae (CV)

## Installation

Copy the [resume.cls](src/resume.cls) and palce it in the same directory where
file with your CV is.

## Usage

Install the document class using steps described in
[installation](#installation) section. After that switch your document to
`resume` document class by putting the following line in its preamble:

```LaTeX
\documentclass{resume}
```

This will give you access to résumé-specific commands defined in
[example.tex](src/example.tex).

## Contributing

If you would like to contribute, clone the directory and run `make.ps1` to build
the example files locally (requires PowerShell Core and Docker).