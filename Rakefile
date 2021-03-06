require 'erb'
require 'json'
require 'rubygems'
require 'highline/import'

directory "source/stylesheets/styletiles"

desc "Create new style tile scaffold"
task :new => :"source/stylesheets/styletiles" do
	#
	# Read in templates
	#
	template   = ERB.new(File.read(File.join("templates","styletile.html.erb")))
	stylesheet = ERB.new(File.read(File.join("templates","stylesheet.scss.erb")))

	#
	# Confirm index exists, determine next template iteration
	#
	if Dir.glob(File.join('source', 'index.html.erb')).empty?
		@iteration = 1
		@name = "index"
	else
		glob_size  = Dir.glob(File.join('source', 'v*.html.erb')).size
		@iteration = (glob_size < 1) ? 2 : glob_size + 2
		@name = "v#{@iteration}"
	end

	#
	# Create new styletile html/scss files
	#
	File.open(File.join("source","#{@name}.html.erb"), 'w') { |file| file.write(template.result) }
	File.open(File.join("source","stylesheets","styletiles","_#{@name}.scss"), 'w') { |file| file.write(stylesheet.result) }

	#
	# Include new SASS file in screen.scss
	#
	File.open(File.join("source","stylesheets","screen.scss"), 'a') { |f| f.write("\n@import \"styletiles/#{@name}\";") }
end

directory "data"

desc "Initialize new project"
task :init => :data do
	#
	# Bootstrap project
	#
	unless File.directory?(File.join('source','stylesheets','framework','bourbon'))
		system(%Q[bundle exec bourbon install --path source/stylesheets/framework])
	else
		puts "Bourbon already installed. Skipping..."
	end
	unless File.directory?(File.join('source','stylesheets','framework','neat'))
		system(%Q[cd source/stylesheets/framework; bundle exec neat install; cd ../../../])
	else
		puts "Neat already installed. Skipping..."
	end
	unless File.directory?(File.join('bower_components'))
		system(%Q[bower install])
	else
		puts "Bower components already installed. Skipping..."
	end

	#
	# Generate project info file from user input
	#
	unless File.file?(File.join('data','project.json'))
		project_info = {}
		project_info[:project] = ask("What is the project's name?  ")
		File.open(File.join("data","project.json"), 'w') { |file| file.write(JSON.dump(project_info)) }
	else
		puts "Project config file already exists at data/project.json. Reusing..."
	end

	#
	# Build first template iteration (index.html.erb + scss)
	#
	Rake::Task["new"].invoke
end