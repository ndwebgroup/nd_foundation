module Nd
module Foundation
  module Generators

    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      argument :dept, type: :string, default: "current"

      def initialize(runtime_args, runtime_options = {}, wat)
        puts runtime_args[0]
        @options = {dept: "current"}
        @options[:dept] = runtime_args[0] unless runtime_args.empty?
        super
      end

      def install
          puts "install layout with #{@options.inspect}"
          copy_layout_file
          copy_header_file
          copy_footer_file
          copy_overrides_file
          append_assets_initializer
          add_css_dependencies
      end

      private

      def dept_code
        dept.downcase
      end

      def copy_layout_file
        puts "create layout file file"
        copy_file "nd_layout.html.erb", "app/views/layouts/nd.html.erb"
      end

      def copy_header_file
        puts @options
        puts "create layout header file"
        template "nd_layout_header.html.erb", "app/views/layouts/_nd_header.html.erb"
      end

      def copy_footer_file
        puts "create layout footer file"
        copy_file "nd_layout_footer.html.erb", "app/views/layouts/_nd_footer.html.erb"
      end

      def copy_overrides_file
        puts "create overrides scss file"
        copy_file "foundation_overrides.scss", "app/assets/stylesheets/foundation_overrides.scss"
      end
      
      def add_css_dependencies
        inject_into_file 'app/assets/stylesheets/application.css', before: " */" do <<-'TXT'
 *= require nd_foundation
 *= require foundation_overrides
        TXT
       end
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
