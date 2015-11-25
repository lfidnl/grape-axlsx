module Grape
  module Formatter
    class Axlsx
      attr_reader :env, :endpoint, :object

      def self.call(object, env)
        new(object, env).call
      end

      def initialize(object, env)
        @object, @env = object, env
        @endpoint     = env['api.endpoint']
      end

      def call
        Grape::Axlsx::Renderer.new(env['api.tilt.root'], template).render(endpoint)
      end

      private

      def template
        endpoint.options.fetch(:route_options, {})[:axlsx]
      end
    end
  end
end
