

desc "set prises if item price = 0"

task :set_prices => :environment do

  require 'open-uri'
  require 'rubygems'
  require 'nokogiri'
  require 'mechanize'

agent = Mechanize.new

page = agent.get("http://rozetka.com.ua/")

  Product.find_all_by_price(0.0).each do |product|
    puts(product.title)
    search_form = page.forms.first
    page.form.text = "#{product.title}"
    page = agent.submit(search_form)
    puts(page.uri.to_s)
    doc = Nokogiri::HTML(open(page.uri.to_s))

    doc.css('.detail').each do |result|
      name = result.css('.title a').text
      price = result.css('.uah').text[/[0-9\.]+/]
      puts(name)
      puts(price)
      puts(product.title)
      puts(product.price)
      price.to_f
      product.update_attribute(:price, price) if name.delete(" ").include? product.title.delete(" ")
    end

    page.form = nil

  end  
 
end  
