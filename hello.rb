require 'sinatra'
require 'rakuten_web_service'



get '/' do
  RakutenWebService.configuration do |c|
    c.application_id = ENV["APPID"]
    c.affiliate_id = ENV["AFID"]
  end
end
