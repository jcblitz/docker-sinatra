require 'sinatra'
require 'sinatra/base'

class App < Sinatra::Base
  get '/' do
    'Word up'
  end
end
