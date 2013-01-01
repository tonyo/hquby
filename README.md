hquby
=====

**hquby** is a HQ9+ implementation written in Ruby.

You can:

- jump straight to interactive mode

  `$ ./hquby.rb`

- execute script from the command line

  `$ ./hquby.rb -e 'hqq+'`

- read commands from the standard input

  `$ echo -n 'hq99+' | ./hquby.rb`

- read commands from script files

  `$ ./hquby.rb script1.hq script2.hq`

**hquby** supports Readline library.

You can also use the following service commands while in interactive mode:

  `:help`               - show options summary

  `:setprompt PROMPT`   - set new prompt

  `:examine`            - print hidden variable value (for debug purposes!)

  `:quit`               - terminate the shell
