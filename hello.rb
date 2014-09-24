require 'sinatra'
require 'rakuten_web_service'



get '/' do
  RakutenWebService.configuration do |c|
    c.application_id = ENV["APPID"]
    c.affiliate_id = ENV["AFID"]
  end

  items = RakutenWebService::Ichiba::Item.search(:keyword => 'Ruby') # This returns Enamerable object
  items.first(10).each do |item|
    puts "#{item['itemName']}, #{item.price} yen" # You can refer to values as well as Hash. 
  end

  root = RakutenWebService::Ichiba::Genre.root # root genre
  # children returns sub genres
  root.children.each do |child|
    puts "[#{child.id}] #{child.name}"
  end
 
  # Use genre id to fetch genre object
  RakutenWebService::Ichiba::Genre[100316].name # => "水・ソフトドリンク"

  RakutenWebService::Ichiba::Item.ranking(:age => 30, :sex => 0) # 30代男性 のランキングTOP 30
  RakutenWebService::Ichiba::Genre[100316].ranking # "水・ソフトドリンク" ジャンルのTOP 30
end
