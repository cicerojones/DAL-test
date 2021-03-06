[Ed. note: please view this file and post.md on Github
https://github.com/hypotext/syntax
to see the rendered style and images :)]

syntax
======


<img src="https://raw.githubusercontent.com/hypotext/syntax/master/images/syntaxhs.png" />

Experiments with syntax and symbols. The code in `syntax.hs` removes the symbols from various kinds of text. 
For more explanation, see `motivation.txt`.

**This is a WIP!** As you can see, the Haskell code is very simple. I'd like to write a PDF parser for math later.

Usage: 
`./syntax [your filenames here, multiple allowed]`
If you change `syntax.hs`, recompile it with a Haskell compiler, e.g. `ghc syntax.hs`. I use the [Haskell platform for Mac OS X](https://www.haskell.org/platform/mac.html).

Credit for original text, in public domain or used under fair use:
- evolution.lisp, ["Land of Lisp"](http://landoflisp.com/evolution.lisp)
- frankenstein.txt, "Frankenstein" by Mary Shelley, [Project Gutenberg](http://www.gutenberg.org/cache/epub/84/pg84.txt)
- whydoi.txt, "'Why do I love' You, Sir?" by Emily Dickinson, [Hello Poetry](http://hellopoetry.com/poem/4029/why-do-i-love-you-sir/)
- final-p3.tex (not included), some math I LaTeXed
- First page of "Uncut" by [Chelsey Minnis](http://new.bostonreview.net/BR27.3/swensen.html)

Syntaxified files are preceded by `syntax-`.
