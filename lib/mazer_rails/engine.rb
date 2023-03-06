require 'autoprefixer-rails'

module MazerRails
  module Rails
    class Engine < ::Rails::Engine
      initializer 'mazer_rails.assets' do |app|
        %w(extensions fonts images javascripts stylesheets).each do |sub|
          app.config.assets.paths << root.join('vendor', 'assets', sub).to_s
        end

        # fix for: https://github.com/twbs/bootstrap-sass/issues/960
        # regex no longer supported by assets.precompile
        # sprockets-rails 3 tracks down the calls to `font_path` and `image_path`
        # and automatically precompiles the referenced assets.
        if old_sprockets?
          app.config.assets.precompile << /\.(?:eot|woff|ttf)$/
        end
      end

      private

      def old_sprockets?
        defined?(Sprockets::Rails) && !Sprockets::Rails::VERSION.starts_with?('3')
      end
    end
  end
end