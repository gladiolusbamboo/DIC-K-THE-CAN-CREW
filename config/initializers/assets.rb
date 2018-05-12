# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( hipster-cards.js )
Rails.application.config.assets.precompile += %w( jquery-1.10.2.js )
Rails.application.config.assets.precompile += %w( bootstrap.min.js )

Rails.application.config.assets.precompile += %w( search.css )
Rails.application.config.assets.precompile += %w( bootstrap.min.css )
Rails.application.config.assets.precompile += %w( hipster_cards.css )
Rails.application.config.assets.precompile += %w( pe-icon-7-stroke.css )

