# -*- coding: utf-8 -*-
require 'rspec'

class Array
  
  #  1 2 3
  #  4 5 6 => 1 2 3 6 9 8 7 4 5 6
  #  7 8 9

  def to_spiral
    @spiral.clear if @spiral
    recursive_top_left_to_bottom_right 0, 0, self.first.size - 1, self.size - 1
    @spiral
  end

  private

  def top_left_to_bottom_right(x1, y1, x2, y2)
    @spiral ||= []

    (x1..x2).each do |i|
      @spiral << self[y1][i]
    end

    ((y1 + 1)..(y2)).each do |j|
      @spiral << self[j][x2]
    end

    @spiral
  end

  def bottom_right_to_top_left(x1, y1, x2, y2)
    @spiral ||= []

    (x2).downto(x1).each do |i|
      @spiral << self[y2][i]
    end

    (y2 - 1).downto(y1).each do |j|
      @spiral << self[j][x1]
    end

    @spiral
  end

  def recursive_top_left_to_bottom_right(x1, y1, x2, y2)
    top_left_to_bottom_right x1, y1, x2, y2
    recursive_bottom_right_to_top_left x1, y1 + 1, x2 - 1, y2 if x2 - x1 > 0
  end

  def recursive_bottom_right_to_top_left(x1, y1, x2, y2)
    bottom_right_to_top_left x1, y1, x2, y2
    recursive_top_left_to_bottom_right x1 + 1, y1, x2, y2 - 1 if x2 - x1 > 0
  end

end
