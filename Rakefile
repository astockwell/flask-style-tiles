require 'erb'
require 'rubygems'

task :tile do
	template = ERB.new(File.read(File.join("templates","styletile.html.erb")))

	glob = Dir.glob(File.join('source', 'v*.html.erb'))
	# puts glob
	# current_version = glob.size > 0 || 1
	@iteration = (glob.size > 0 || 1) + 1
	# puts "v#{@iteration}.html.erb"

	File.open(File.join("source","v#{@iteration}.html.erb"), 'w') { |file| file.write(template.result) }
end
