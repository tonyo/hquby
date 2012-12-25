#!/usr/bin/env ruby

def main
  str = ARGV[0] || 'hqqahq'
  str.gsub(/\s+/, '')

  commands = str.split('')
  # check commands
  commands.each_index do |c|
    if not ['h', 'q', '9', '+'].include? commands[c]
      abort "Aborted, unknown symbol: '#{commands[c]}' (:#{c})"
    end    
  end

  commands.each do |x|
    case x
    when 'h' then eval_h
    when 'q' then eval_q(str)
    when '9' then eval_9
    when '+' then eval_plus
    end
  end
end


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


main()
