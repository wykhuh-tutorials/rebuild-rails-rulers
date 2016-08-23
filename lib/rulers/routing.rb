module Rulers
  class Application
    # convert /quotes/index to [QuotesController, index]
    def get_controller_and_action(env)
      # split no more than 4 times
      _, cont, action, after = env["PATH_INFO"].split('/', 4)
      cont = "#{cont.capitalize}Controller"
      # const_get - look up any name starting with a capital letter.
      # get the constant (eg class name)  for the given string
      [Object.const_get(cont), action]
    end
  end
end
