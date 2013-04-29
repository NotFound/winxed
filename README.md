Winxed compiler.
================

(C) 2009-2012 Julián Albo

## Build:

You need a C++ compiler and parrot installed an in your PATH.

- Use 'make' to build.
- Use 'make install' to install. It gets installed in the appropiate
directories of the parrot install.
- Alternatively, you can install Winxed using parrot plumage.
That way a C++ compiler is not needed.


## Usage:
`winxed [options] sourcefile`

## Command line options:

* `--target pir`  
Compile to pir
* `--target pbc`  
Compile to pir, call parrot to compile to pbc
and delete the pir file.
* `-o filename`  
Use filename for the generated file.
* `-c`  
Compile only. Same as --target pir
* `-e codfragment`  
Evaluate. The code fragment provided is compiled
inside a 'function main(argv) {' ... ';}' enveloppe.
Useful for one-liners and quick tests.
* `--help`  
Show help

See --help for more options.

## Web site:

[http://winxed.net/](http://winxed.net/)

## Code repository:

[https://github.com/NotFound/winxed](https://github.com/NotFound/winxed)
