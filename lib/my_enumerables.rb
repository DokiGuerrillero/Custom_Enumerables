# frozen_string_literal: true

# docs
module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    for element in self
      yield(element, index)
      index += 1
    end
    self
  end

  def my_select
    cum = []
    for element in self
      cum.push(element) if yield(element) == true
    end
    cum
  end

  def my_all?
    state = true
    for element in self
      state = false unless yield(element) == true
    end
    state
  end

  def my_any?
    state = false
    for element in self
      state = true if yield(element) == true
    end
    state
  end

  def my_none?
    state = true
    for element in self
      state = false if yield(element) == true
    end
    state
  end

  def my_count
    return length unless block_given?

    num = 0
    for element in self
      num += 1 if yield(element) == true
    end
    num
  end

  def my_map
    array = []
    for element in self
      array.push(yield element)
    end
    array
  end

  def my_inject(initial = 0)
    sum = initial
    for element in self
      sum = yield(sum, element)
    end
    sum
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self
      yield(element)
    end
    self
  end
end
