# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.scss, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w( home.css home.js option/option.scss)
#all
Rails.application.config.assets.precompile += %w( admin_application.scss admin_application.js) #admin

Rails.application.config.assets.precompile += %w(lojista_application.scss lojista_application.js) #lojista