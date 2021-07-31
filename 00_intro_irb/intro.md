# Ruby Intro
Wiki: https://en.wikipedia.org/wiki/Ruby_(programming_language)

Quote from wiki:
"Ruby is an interpreted, high-level, general-purpose programming language. It was designed and developed in the mid-1990s by Yukihiro "Matz" Matsumoto in Japan.

Ruby is dynamically typed and uses garbage collection and just-in-time compilation. It supports multiple programming paradigms, including procedural, object-oriented, and functional programming. According to the creator, Ruby was influenced by Perl, Smalltalk, Eiffel, Ada, BASIC, and Lisp."

## Ruby in Console

Node offers us `node` as a way of writing and executing code in the terminal directly. Ruby has its own way of doing so and it is `irb` ( Interactive Ruby ). Rails adds a layer on this where it loads the current directory's rails app's files in the interactive ruby prompt called with `rails c`.

In `irb` you can do anything that you can do in the standard files: execute math operations; declare variables; create methods, classes, and modules; and load additional resources.

Additionally, you can write some executable ruby code in a file and invoke it in the command line via `ruby dir/file_name.rb`.

To access the executable code you've written in a file in an `irb` console, you can utilize the `require_relative` method and pass it a string of the relative filepath to the file in question. Thus, from the root level of this, you can enter the `irb` console and type `require_relative "00_intro_irb/main.rb"` to load that file's full content and thus call the individual methods as desired.

Displaying data in terminal ( and often in console ) requires the use of one of two basic methods: `puts` and `p`. `puts` formats the output slightly while `p` does not. Ruby natively returns the last line of any method and will show its content in the `irb` console. However, merely running the file will not display any method returns unless explicitly told to do so.
