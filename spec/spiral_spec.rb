# -*- coding: utf-8 -*-
require "rspec"
require 'spiral'

describe 'Array' do
  let! (:array) {
    [
      [1, 2, 3], 
      [4, 5, 6], 
      [7, 8, 9],
      [10,11,12]
    ]   
  }

  let! (:square_array) { 
    [
      [1, 2, 3], 
      [4, 5, 6], 
      [7, 8, 9]
    ] 
  }
  let! (:big_square_array) {
    [
      [1,  2,  3,  4,  5],
      [6,  7,  8,  9,  10],
      [11, 12, 13, 14, 15],
      [16, 17, 18, 19, 20],
      [21, 22, 23, 24, 25]
    ]
  }


  describe '#to_spiral' do
    it 'should return a clockwise array single dimensional array' do
      array.to_spiral.should eql [1, 2, 3, 6, 9, 12, 11, 10, 7, 4, 5, 8]
    end

    it 'should return a clockwise array single dimensional array' do
      square_array.to_spiral.should eql [1, 2, 3, 6, 9, 8, 7, 4, 5]
    end

    it 'should return a clockwise array single dimensional array for big array' do
      big_square_array.to_spiral.should eql %w[1 2 3 4 5 10 15 20 25 24 23 22 21 16 11 6 7 8 9 14 19 18 17 12 13].collect(&:to_i)
    end

    it 'should return correct sum of the array' do
      array.to_spiral.inject(:+).should eql array.inject(:+).inject(:+)
    end

    it 'should return correct sum of the square array' do
      square_array.to_spiral.inject(:+).should eql square_array.inject(:+).inject(:+)
    end
  end

  describe '#top_left_to_bottom_right' do
    specify { array.send(:top_left_to_bottom_right, 0, 0, 2, 3).should eql [1, 2, 3, 6, 9, 12] }
    specify { square_array.send(:top_left_to_bottom_right, 0, 0, 2, 2).should eql [1, 2, 3, 6, 9] }
  end

  describe '#bottom_right_to_top_left' do
    specify { array.send(:bottom_right_to_top_left, 0, 0, 2, 3).should eql [12, 11, 10, 7, 4, 1] }
    specify { square_array.send(:bottom_right_to_top_left, 0, 0, 2, 2).should eql [9, 8, 7, 4, 1] }
  end

end
