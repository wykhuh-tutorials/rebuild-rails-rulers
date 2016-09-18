require "rulers/version"
require "rulers/routing"

module Rulers
  class Application
    def call(env)
      # get controller and action from the url
      klass, act = get_controller_and_action(env)
      # make new controller
      controller = klass.new(env)
      # send the new controller an action
      text = controller.send(act)

      [
        200,
        {'Content-Type' => 'text/html'},
        [text]
      ]
    end
  end

  class Controller
    attr_reader :env
    def initialize(env)
      @env = env
    end
  end
end
