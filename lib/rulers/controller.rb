require "erubis"

module Rulers
  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end

    # locals is a hash of variables we pass to render
    def render(view_name, locals = {})
      filepath = File.join "app", "views", controller_name, "#{view_name}.html.erb"
      template = File.read filepath
      eruby = Erubis::Eruby.new(template)
      eruby.result(locals.merge(env: env))
    end

    # Convert QuotesController to quotes
    def controller_name
      klass = self.class
      klass = klass.to_s.gsub /Controller$/, ""
      Rulers.to_underscore(klass)
    end
  end
end
