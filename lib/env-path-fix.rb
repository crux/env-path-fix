#!/usr/bin/env ruby

require 'pathname'

ops = { 
  '$' => :append, 
  "+" => :prepend, "^" => :prepend, 
  "-" => :remove, "--" => :remove_re 
}

# EnvPathFix
#
class EnvPathFix
  def initialize
    @a = (ENV['PATH'].split ':').map { |p| Pathname.new(p).cleanpath.to_s }
    clean
  end

  def append(*args)
    @a.push(*args)
    self.clean
  end

  def prepend(*args)
    @a.unshift(*args)
    self.clean
  end

  def remove(*args)
    args.each { |e| @a.delete e }
    self.clean
  end

  def remove_re(*args)
    args.each { |re| @a.delete_if { |e| e.match(re) } }
    self.clean
  end

  def clean 
    @a.uniq!
    self
  end

  def to_s
    @a.uniq.join ':'
  end
end

begin
  op = ARGV.shift || :clean
  op = ops[op] || op
  path = EnvPathFix.new.send op, *ARGV
  puts path
rescue => e
  puts "#{e}"
  $stderr.puts <<-EOT

usage: 
  #{$0} (prepend | remove | append) <args> ...
  #{$0} clean

  EOT
  puts ENV['PATH']
  exit -1
end
