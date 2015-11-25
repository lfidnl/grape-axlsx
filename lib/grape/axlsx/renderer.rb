module Grape
  module Axlsx
    class Renderer
      attr_reader :view_path, :template

      def initialize(view_path, template)
        @view_path, @template = view_path, template
      end

      def render(scope)
        unless view_path
          raise "Use Rack::Config to set 'api.tilt.root' in config.ru"
        end

        context = scope.instance_eval { binding }
        eval "xlsx_package = ::Axlsx::Package.new; #{template_content}; xlsx_package.to_stream.string;", context
      end

      private

      def file
        File.join view_path, template_with_extension
      end

      def template_with_extension
        template[/\.axlsx$/] ? template : "#{template}.axlsx"
      end

      def template_content
        File.read(file)
      end
    end
  end
end
