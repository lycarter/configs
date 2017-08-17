#!/usr/bin/ruby
 
if ARGV.empty?
  # Use the second exec instead to only need one file.
  exec("git status | perl -e ' $i = 0; while (<>) { print \"$i $_\"; $i += 1;}'")
  Kernel.exit(0)
end
 
if ARGV[0] == "-h"
  puts "usage: gg # prints line numbers"
  puts "usage: gg comma-separated-line-numbers multi word command"
  puts "example: gg 5,7,40-50 git add"
  Kernel.exit(1)
end
 
status = `git status`
 
index_arg = ARGV.shift
 
indices = index_arg.split(',').map do |i|
  if i[ /^(\d+)\-(\d+)$/ ]
    start = $1.to_i
    stop = $2.to_i
    next (start..stop).to_a
  elsif i[ /^(\d+)$/ ]
    next $1.to_i
  else
    raise i + " is not a number or range"
  end    
end.flatten
 
to_add = []
 
status.lines.each_with_index do | line, i|
  if indices.include? i
    if line.include? ':'
      file = line[/:\s+(.*)/, 1]
    else
      file = line[/\#?\s+(.*)/, 1]
    end
    to_add << file
  end
end

 
files = to_add.map{|arg|"\"#{arg}\"" }.join(" ") 
if ARGV.empty?
  puts files
else
  command = ARGV.join(' ') + " " + files
  puts command
  puts
  system("bash -ci " + command)
  #system %(
  #  source ~/.bash_aliases
  #  shopt -s expand_aliases
  #)
#  exec("shopt -s expand_aliases" + "\n" + "source ~/.bash_aliases" + "\n" + command)
end
