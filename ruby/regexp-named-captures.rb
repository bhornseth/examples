
test_string = '07/04/1776'
regexp = /(?<month>\d{2})\/(?<day>\d{2})\/(?<year>\d{4})/

match_data = test_string.match(regexp)

puts match_data[:month]
puts match_data[:day]
puts match_data[:year]
