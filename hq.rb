#!/usr/bin/env ruby

require 'optparse'

def eval_h
  puts "Hello, world!"
end

def eval_q(script_string)
  puts script_string
end

def eval_9
  # bottles
end

$i = 0
def eval_plus
  $i += 1
end

def usage
  puts <<-USAGE
Usage:

  -h, --help  - show help
  -e SCRIPT   - execute script
  USAGE
end

def eval_string(str)
  str.gsub!(/\s+/, '')
  commands = str.split('')

  # check commands
  commands.each_index do |c|
    if not ['h', 'q', '9', '+'].include? commands[c]
      abort "Aborted, unknown symbol: '#{commands[c]}' (:#{c})"
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

optparse = OptionParser.new do |opts|

  # This displays the help screen, all programs are
  # assumed to have this option.
  opts.on('-h', '--help', 'Display usage') do
    usage()
    exit
  end

  opts.on('-e SCRIPT', 'Execute script from command line') do |scr|
    eval_string(scr)
  end
end
optparse.parse!


