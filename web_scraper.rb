require 'nokogiri'
require 'open-uri'

# Target website URL
url = 'https://example.com'

# Fetch and parse HTML document
html = URI.open(url)
doc = Nokogiri::HTML(html)

# Extract and print all links
doc.css('a').each do |link|
  puts "Link Text: #{link.text.strip}"
  puts "URL: #{link['href']}"
end

# Extract and print headings
doc.css('h1, h2, h3').each do |heading|
  puts "#{heading.name.capitalize}: #{heading.text.strip}"
end

# Save all images
doc.css('img').each_with_index do |img, index|
  img_url = img['src']
  next unless img_url
  
  File.open("image_#{index + 1}.jpg", 'wb') do |file|
    file.write(URI.open(img_url).read)
  end
end

puts "Web scraping completed!"
