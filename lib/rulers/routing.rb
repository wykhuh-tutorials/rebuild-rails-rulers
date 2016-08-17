module Rulers
  class Application
    def get_controller_and_action(env)
      # split no more than 4 times
      _, cont, action, after = env["PATH_INFO"].split('/', 4)
      cont = "#{cont.capitalize}Controller"
      # const_get - look up any name starting with a capital letter
      [Object.const_get(cont), action]
    end
  end
end
