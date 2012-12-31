#!/usr/bin/env ruby

require 'optparse'

def eval_h
  puts "Hello, world!"
end

def eval_q(script_string)
  puts script_string
end

def eval_9

  def multibeer(n)
    n = n.to_i
    case n
    when 0 then 'no more bottles'
    when 1 then '1 bottle'
    else "#{n} bottles"
    end
  end
  99.downto(1) do |i|
    puts <<-BOTTLES
#{multibeer(i)} of beer on the wall, #{multibeer(i)} of beer.
Take one down and pass it around, #{multibeer(i-1)} of beer on the wall.

    BOTTLES
  end

    puts <<-BOTTLES_ENDING
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
    BOTTLES_ENDING
end

$i = 0
def eval_plus
  $i += 1
end

def usage
  puts <<-USAGE
Usage:

  -h, --help    - show help
  -e SCRIPT     - execute script

  no arguments  - fall back to interactive mode
  USAGE
end

def greeting
  puts <<-GREETING
--- Welcome to hquby interactive mode!
--- hquby is an implementation of HQ9+ interpreter.
  GREETING
end

def eval_string(str)
  str.downcase!
  str.gsub!(/\s+/, '')
  commands = str.split('')

  # check commands
  commands.each_index do |c|
    if not ['h', 'q', '9', '+'].include? commands[c]
      $stderr.puts "~ Error! Unknown symbol: '#{commands[c]}' (:#{c})"
      return
    end
  end

  # exec
  commands.each do |x|
    case x
    when 'h' then eval_h
    when 'q' then eval_q(str)
    when '9' then eval_9
    when '+' then eval_plus
    end
  end
end


########
# MAIN #
########

optparse = OptionParser.new do |opts|
  opts.on('-h', '--help', 'Display usage') do
    usage()
    exit(0)
  end

  opts.on('-e SCRIPT', 'Execute script from command line') do |scr|
    eval_string(scr)
    exit(0)
  end
end
optparse.parse!


# Read from scripts or STDIN
if not ARGV.empty? or not $stdin.tty?
  ARGF.each do |line|
    eval_string(line.chomp)
  end
  exit(0)
end


# Fall back to interactive mode
# TODO Check 'Readline' support!
require 'readline'
PROMPT = '>> '
$stdout.sync = true

trap('INT') do
  puts "\n~ Interrupt"
  print PROMPT
end

greeting()
while line = Readline.readline(PROMPT, true)
  eval_string(line.chomp)
end


