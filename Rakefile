require 'erb'
require 'rubygems'

task :tile do
	template   = ERB.new(File.read(File.join("templates","styletile.html.erb")))
	stylesheet = ERB.new(File.read(File.join("templates","stylesheet.scss.erb")))

	glob = Dir.glob(File.join('source', 'v*.html.erb'))
	glob_size = glob.size

	@iteration = (glob_size < 1) ? 2 : glob_size + 2

	File.open(File.join("source","v#{@iteration}.html.erb"), 'w') { |file| file.write(template.result) }
	File.open(File.join("source","stylesheets","styletiles","_v#{@iteration}.scss"), 'w') { |file| file.write(stylesheet.result) }

	File.open(File.join("source","stylesheets","screen.scss"), 'a') { |f| f.write("\n@import \"styletiles/v#{@iteration}\";") }
end