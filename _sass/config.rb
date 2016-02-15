require 'sass-media_query_combiner'
require 'autoprefixer-rails'

on_stylesheet_saved do |file|
  css = File.read(file)
  File.open(file, 'w') do |io|
    io << AutoprefixerRails.process(css, browsers: ["last 2 version", "> 1%"])
  end
end

http_path = "/" 
sass_dir = "./" 
css_dir = "../css"
images_dir = "../img" 
javascripts_dir = "../js" 

line_comments = false
relative_assets = true 
output_style = :compressed
