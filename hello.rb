require 'sinatra'
require 'rakuten_web_service'

get '/' do
  "hell"
  ENV["APPID"]
end
