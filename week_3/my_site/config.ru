require 'rack'
require './lib/mysite'

run Application.new.run
