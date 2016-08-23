require 'erubis'

template = <<TEMPLATE
Hello! This is a tempalte.
It has <%= blah %>.
TEMPLATE

eruby = Erubis::Eruby.new(template)
# src “give me the code for this template.”
puts eruby.src
puts "===="
puts eruby.result(blah: 'good stuff')
