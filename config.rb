require 'json'

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

after_configuration do
  sprockets.append_path(File.join(root, 'bower_components'))
end

helpers do
  #
  # Provide deploy target site root url
  #
  def site_url
    "http://dev.extrasmalldesign.com"
  end

  #
  # Read and provide project name to layout
  #
  def get_project_name
    begin
      project_info = JSON.parse(File.read(File.join("data","project.json")))
      project_info["project"]
    rescue
      "client name not set, run: <code>rake init</code>"
    end
  end

  #
  # Provide previous styletile link to layout (if avail)
  #
  def prev_link
    unless current_resource.path.include? "index.html"
      if current_resource.path.include? "v2"
        return "index.html"
      else
        current_iteration = Integer(current_resource.path.gsub(/(.*?v|\.html)/) { |match| "" })
        return current_resource.path.gsub(/#{current_iteration}/) { |match| current_iteration - 1 }
      end
    end

    return false
  end

  #
  # Provide next styletile link to layout (if avail)
  #
  def next_link
    num_of_iterations = Dir.glob(File.join('source', '*v*.html.erb')).size

    if current_resource.path.include? "index.html"
      if num_of_iterations > 0
        return "v2.html"
      else
        return false
      end
    end

    if num_of_iterations > 0
      current_iteration = Integer(current_resource.path.gsub(/(.*?v|\.html)/) { |match| "" })

      if current_iteration <= num_of_iterations
        return current_resource.path.gsub(/#{current_iteration}/) { |match| current_iteration + 1 }
      else
        return false
      end
    end

    return false
  end
end