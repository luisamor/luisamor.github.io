# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

 

# Assets
set :css_dir, "assets/stylesheets"
set :js_dir, "assets/javascripts"
set :fonts_dir, "assets/fonts"
set :images_dir, "assets/images"
 

# Build-specific configuration
configure :build do
  # Change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash 

  activate :favicon_maker do |f|
    f.template_dir  = 'source/assets/images'
    f.output_dir  = 'source/assets/images'
    f.icons = {
      "_favicon_template.png" => [
        { icon: "apple-touch-icon-144x144.png", size: "144x144" },
        { icon: "apple-touch-icon-114x114.png", size: "114x114" },
        { icon: "apple-touch-icon-72x72.png",   size: "72x72" },                
        { icon: "favicon.ico", size: "64x64,32x32,16x16" },
        { icon: "favicon.png", size: "16x16" }
      ]   
    }
  end

end

activate :deploy do |deploy|
  deploy.deploy_method = :git
  # Optional Settings
  # deploy.remote   = 'custom-remote' # remote name or git url, default: origin
   deploy.branch   = 'master' # default: gh-pages
  # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
end

activate :minify_html do |html|
  html.remove_multi_spaces        = true   # Remove multiple spaces
  html.remove_comments            = true   # Remove comments
  html.remove_intertag_spaces     = false  # Remove inter-tag spaces
  html.remove_quotes              = false  # Remove quotes
  html.simple_doctype             = false  # Use simple doctype
  html.remove_script_attributes   = false  # Remove script attributes
  html.remove_style_attributes    = true   # Remove style attributes
  html.remove_link_attributes     = false  # Remove link attributes
  html.remove_form_attributes     = false  # Remove form attributes
  html.remove_input_attributes    = true   # Remove input attributes
  html.remove_javascript_protocol = true   # Remove JS protocol
  html.remove_http_protocol       = false  # Remove HTTP protocol
  html.remove_https_protocol      = false  # Remove HTTPS protocol
  html.preserve_line_breaks       = false  # Preserve line breaks
  html.simple_boolean_attributes  = true   # Use simple boolean attributes
  html.preserve_patterns          = nil    # Patterns to preserve
end

