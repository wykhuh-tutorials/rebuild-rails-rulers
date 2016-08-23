class Object
  # when an unknown constant (e.g class) is called, ruby calls const_missing

  # const_missing + const_get lets Rulers & Rails to autoload files for a given
  # class without having to write a 'require xxx' for each file
  def self.const_missing(c)
    # turn QuotesController into 'quotes_controller'
    # try to require/load a file  'quotes_controller'
    require Rulers.to_underscore(c.to_s)
    # get the class QuotesController for symbol QuotesController
    Object.const_get(c)
  end
end
