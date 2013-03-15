desc "set prises if item price = 0"

task :set_prices => :environment do

  require 'open-uri'
  require 'rubygems'
  require 'nokogiri'

  doc = Nokogiri::HTML(open('http://rozetka.com.ua/saws/c152560/'))

  Product.find_all_by_price(0.0).each do |product|
    puts(product.title)
    doc.css('.gtile-i-box').each do |result|
      name = result.at_css('.gtile-i-title a').text
      price = result.at_css('.g-price-uah').text[/[0-9\.]+/]
      price.to_f
      product.update_attribute(:price, price) if name.include? product.title
   
    end
  end  
 
end  