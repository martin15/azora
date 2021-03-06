# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w(
  font-awesome.css bootstrap.css owl.carousel.css owl.transitions.css lightgallery.css aos.css
  admin.css select2.css 
  disrupt.js owl.carousel.min.js select2.full.js isotope.js bootstrap.js html5shiv.js aos.js
  masonry.pkgd.min.js light-gallery/*
  *.svg *.eot *.woff *.ttf *.woff2 *.otf
  ckeditor/filebrowser/images/gal_del.png infinite-scroll
)
