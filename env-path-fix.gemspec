Gem::Specification.new do |gem|
  gem.name     = "env-path-fix.rb"
  gem.version  = "0.1.0"
  gem.date     = "2009-01-03"
  gem.summary  = "making PATH ENV var manipulation easy"
  gem.email    = "env-path-fix.rb@sebrink.de"
  gem.homepage = "http://github.com/crux/env-path-fix.rb"
  gem.description = "ruby script to append, prepend, remove, remove by regexp and remove duplicate entries from PATH (shell) variable. Use it to simplify environment setup from shell scripts"
  gem.authors  = ["dirk l. sebrink"]
  gem.files    = ["History.txt", 
		"README.markdown", 
		"env-path-fix.gemspec", 
		"lib/env-path-fix.rb"]
  gem.test_files = ["test/test_pathfix.rb"]
  gem.has_rdoc = true
  gem.rdoc_options = ["--main", "README.markdown"]
  gem.extra_rdoc_files = ["History.txt", "README.markdown"]
  #gem.add_dependency("open4", ["> 0.0.0"]) 
end
