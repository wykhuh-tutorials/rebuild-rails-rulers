module Rulers
  # convert CamelCase to snake_case
  def self.to_underscore(string)
    # replace '::' with '/'
    string.gsub(/::/, '/').
    # “BOBSays” to “BOB_says”
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    # “a7D” into “a7_D” or “b4M” into “b4_M”
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    #  turns all dashes into underscores
    tr("-", "_").
    downcase
  end
end
