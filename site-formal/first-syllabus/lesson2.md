# Plans for Module 2
At risk of making this one less polished with a little more "link-dumping", here's my initial notes to myself on what I was planning. There's no niceties of explaining for a general audience here:

## Basic Outline
- introduce Terminal
- use terminal to install homebrew
- install Processing from website; uninstall; and then install with homebrew
    - https://github.com/caskroom/homebrew-cask/blob/master/Casks/processing.rb
- run something cool from Processing
- start up Processing from command line
- make some modification to Processing sketch

# Steps
1. Open up Terminal.app (can you figure out how to find it? Use Spotlight, if you are unsure. Ultimately you will be using this enough that you want it to be easy to get to).

2. [Install homebrew](http://brew.sh) by "following the instructions" for getting it installed. Make a note if things fail, or you get scared. Getting started on the command line can be tricky, and I'm happy to help troubleshoot.

3. Visit the [Processing website](https://processing.org) and poke around. Processing has been around for a relatively long time now, and occupies an important place within "creative coding" pedagogical frameworks.

    You can follow the links to the download from the website and actually download it that way, but if you should do so, you should then uninstall it (how do you uninstall apps on a Mac?)

4. Install processing using 'homebrew.' 

    This is going to involve writing something even more like code than Markdown. To use the command line (aka, on a Mac called the terminal), you have to use a kind of language, a "shell language", if you will (though that is not a standard term), for interacting with a **shell**.

    Here are links related to stuff you looked at yesterday that will give a little more sense of what's involved in using a Terminal, aka the shell (note that `bash` is the type of shell that Terminal.app defaults to):

    http://cli.learncodethehardway.org/book/
    http://hyperpolyglot.org/unix-shells

    More important for this step, though, you may also have to deal with understanding a little bit about how to use **homebrew** to download and install software. I'm being deliberately vague here--it's for pedagogical reasons!

    But if you hate ambiguity (or *this* much vagueness) and you need help, look back over the webpage for an example of using homebrew to `install` some software. The "code" you have to type to install `processing` is not *that* complicated, but it might not be at all obvious right away. Try typing stuff at the command line, and see if homebrew (aka `brew`) has anything to report back. 

    PS. Hints are sort of being dropped in that last paragraph.

5. Open up Processing.app, which has been installed into your Applications folder (all this works the same as when you use applications on a Mac that were installed the usual way).

    It may take some time to get familiar with the Processing interface. But the basic idea is that you will open up files (which are called **sketches** in Processing lingo) and press a "Play" button as if you were playing a track on a CD. 

    While writing our own sketches (the term "writing" here is potentially misleading; one really "writes Processing code", which is tantamount to *programming*!) is an ultimate goal, Processing luckily also comes with many already "written" sketches, which we just have to locate and run ourselves.

6. Navigate to the Examples folder (using the File drop-down menu). Feel to poke around, but for this exercise, we are going to want to work from the Demos folder.

    Clicking on Demos will reveal a few more subfolders (or subdirectories to use the jargon of *the shell*). We want the `RotatingArcs` sketch, which is in Graphics. Click on this file, look over the code (which is written--basically--in Java) if you wish, and then hit the "Play" or Run button at the top of the editor window. Anything happen? 


7. Looking more carefully at the code is a prelude to doing some coding ourselves

    Hopefully, hitting the play button had the effect of running all that code and displaying a cool looking animation (did you figure out that to stop it you could either click the red "X button" on the pop-up window, or hit `Apple + Q`.)

    You could get really deep at this step thinking about the relation between all that seemingly indecipherable English (with its techie-looking fonts and garish coloring and weird punctuation) and the reasonably complex, if not beautiful-in-its-own-way, visual that you saw.

    But first, let's make one change to the code so that we can say we were actually doing some programming and not just doing a really complicated version of watching an animated GIF.

    Scroll down till you see some seemingly plain English: `// Speed of rotation`. That, my friend, is called a comment (kind of like the comments you left on the document you edited in the last exercise), and it is there purely for the convenience of people who are trying to read this code and figure out what the hell is going on! In this case, the comment describes what the hell is going on with the code on that line:

    `pt[index++] = radians(random(5, 30))/5;`

    At the risk of exaggerating, it's fair to say that without comments, code is virtually useless to anyone but the computer, which doesn't see or care about comments.

8. Let's make a change!

    We are going to make an edit to someone else's code, because, by the beauty of **open source**, this code is now basically your code as well! (Don't worry, they won't ever know about your change, unless you publicize it). However, Processing will require you to save your edit to a file with a different name, because someone wanted to make sure you could always get back to that original version of the code.

    So, let's change the two numbers between the parentheses that follow `random`. What effect will doing something so seemingly trivial do, when there are 150 lines of code here? And what should we change it to? My suggestion when doing something like this (i.e. tinkering with someone else's code) is to make small-ish changes that are consistent with the numbers that are already there. Tinkering with existing code is neither an art nor a science, but I think it wise to limit the size of such a change to be within *one order of magnitude* (e.g. change 30 to 300. And while we're at it, let's change the 3 to 30) of the existing values

    Trying to hit Run (i.e. Play) now will prompt you to make a change to the name of the file so you can save your change without destroying the values used in the original. What happens?





## Additional notes

- consider creating an *Advanced* or *Extra Credit* feature

- tie-in organization here to a DAL directory and plan on my local machine

- all this writing should be backed up locally or at least to Dropbox etc.

- if collaboration works consider subscribing to support Draft
