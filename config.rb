# -*- coding: utf-8 -*-
require 'slim'
Slim::Engine.disable_option_validator!

I18n.enforce_available_locales = true
# general settings
set :encoding, 'utf-8'
set :index_file, 'index.html'
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :partials_dir, 'partials'
set :haml, { :format => :html5 }

ignore '*.less'

activate :livereload

activate :directory_indexes


helpers do
  def chapters( post )
    File.readlines( post.source_file ).collect do |x|
      if x =~ /^\#{1,6}\s(.*)/
        $1
      else
        nil
      end
    end.select { |x| x }
  end

  def button(href,text,size='dummy')
    "<a class='btn btn-#{size} btn-raised btn-material-red-800' href='#{base}/#{href}'>#{text}<div class='ripple-wrapper'></div></a>"
  end

  def button_l(*params)
    button(*params, "lg")
  end

  def button_s(*params)
    button(*params, "sm")
  end

  def button_xs(*params)
    button(*params, "xs")
  end

end

set :markdown, :tables => true, :autolink => true, :gh_blockcode => true, :fenced_code_blocks => true, :with_toc_data => true
set :markdown_engine, :redcarpet

configure :development do
  set :base, ""
  activate :relative_assets
end

configure :build do
  set :base, "/startpack"
  activate :relative_assets
  # activate :directory_indexes
  activate :sprockets
  activate :minify_css
  activate :minify_javascript
  set :relative_links, true
  # somehow minifying html takes some html attributes away so it is causing
  # some css not applied to certain elements... so until we find alternative
  # way to monify html, we will disable this
  #activate :minify_html
  activate :asset_hash
  #activate :gzip
  ignore 'product.html'
  ignore(/Icon\r$/)
  ignore(/\.DS_Store/)
  ignore(/^assets.*\.yml/)
  ignore(/^assets\/stylesheets\/(?!all).*\.css/)
  ignore(/^assets\/javascripts\/(?!all).*\.js/)
  ignore(%r{^assets/stylesheets/colorschemas/.*})
  ignore(%r{^assets/images/homepage-slider/pysanka-.*\.jpg$})
  ignore(%r{/src/})


  # if ENV['CDN_HOST']
  #   activate :asset_host
  #   set :asset_host, ENV['CDN_HOST']
  # end
end
