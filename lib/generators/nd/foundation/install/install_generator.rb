module Nd
module Foundation
  module Generators

    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      #attr_reader :stack_id, :app_id

      def initialize(runtime_args, runtime_options = {}, wat)
        super
      end

      def install
          puts "install layout"
          copy_layout_file
          append_assets_initializer
      end

      private


      def copy_layout_file
        puts "create layout file file"
        copy_file "nd_layout.html.erb", "app/views/layouts/nd.html.erb"
      end

      def append_assets_initializer
        puts "adding to assets precompile"
        append_to_file 'config/initializers/assets.rb' do <<-'RUBY'

#allow assets from vendor to be compiled along with application's assets
Rails.application.config.assets.precompile += %w(*.svg *.eot *.woff *.ttf *.gif *.png *.ico)
        RUBY
        end
      end
    end
  end

end
end
