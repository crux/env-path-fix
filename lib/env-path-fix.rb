# EnvPathFix
#
class EnvPathFix

  require 'pathname'

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
