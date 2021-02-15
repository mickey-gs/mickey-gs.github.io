# generate_htmls.rb
require "csv"
require "erb"

contents = CSV.open("signs.csv", headers: true)
contents.each do |row|
  zodiac_txt = row[2]
  path = "info/#{zodiac_txt}"
  information = File.open(path, "r").read.chomp.split("*")
  new_name = zodiac_txt.gsub("txt", "html")
  sign = row[1]
  traits = information[0]
  gifts = information[1]
  challenges = information[2]
  template = File.open("template.erb", "r").read
  html_file = ERB.new(template)
  results = html_file.result(binding)
  File.open(new_name.capitalize, "w") { |f| f.puts results }
end
