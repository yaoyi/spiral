#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/lib/spiral'

array = [
  [12, 32, 9, 11, 34],
  [8,  54, 76, 23, 7],
  [27, 18, 25, 9, 43],
  [11, 23, 78, 63, 19],
  [9,  22, 56, 31, 5]
]

puts 'matrix:'
array.each {|row| p row}
spiral = array.to_spiral
puts 'clockwise spiral: ' + '[' + spiral.join(', ') + ']'
puts 'sum: ' + spiral.inject(:+).to_s
