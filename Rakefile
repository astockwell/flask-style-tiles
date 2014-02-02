require 'erb'
require 'rubygems'

desc "Create new style tile scaffold"
task :new do
	# Read in templates
	template   = ERB.new(File.read(File.join("templates","styletile.html.erb")))
	stylesheet = ERB.new(File.read(File.join("templates","stylesheet.scss.erb")))

	# Determine next template iteration
	glob_size  = Dir.glob(File.join('source', 'v*.html.erb')).size
	@iteration = (glob_size < 1) ? 2 : glob_size + 2

	# Create new styletile html/scss files
	File.open(File.join("source","v#{@iteration}.html.erb"), 'w') { |file| file.write(template.result) }
	File.open(File.join("source","stylesheets","styletiles","_v#{@iteration}.scss"), 'w') { |file| file.write(stylesheet.result) }

	# Include new SASS file in screen.scss
	File.open(File.join("source","stylesheets","screen.scss"), 'a') { |f| f.write("\n@import \"styletiles/v#{@iteration}\";") }
end

desc "Initialize new project"
task :init do
	system(%Q[bundle install])
	system(%Q[bundle exec bourbon install --path source/stylesheets/framework])
	system(%Q[cd source/stylesheets/framework; bundle exec neat install; cd ../../])
	system(%Q[bower install])
end