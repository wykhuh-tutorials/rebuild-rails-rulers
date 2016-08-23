class Object
  # when an unknown constant (e.g class) is called, ruby calls const_missing

  # const_missing + const_get lets Rulers & Rails to autoload files for a given
  # class without having to write a 'require xxx' for each file
  def self.const_missing(c)
    # if QuotesController doesn't exist, the app goes in endless loop of
    # const_missing and const_get. to prevent the endless loop, we do early
    # return if const_missing is being called
    return nil if @calling_const_missing

    @calling_const_missing = true
    # turn QuotesController into 'quotes_controller'
    # try to require/load a file  'quotes_controller'
    require Rulers.to_underscore(c.to_s)
    # get the class QuotesController for symbol QuotesController
    klass = Object.const_get(c)
    @calling_const_missing = true

    klass
  end
end
