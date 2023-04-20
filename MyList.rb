require_relative 'myEnumerable'

class MyList
  include Enumerable

  def initialize(*list)
    @list = list
  end

  def each
    return to_enum unless block_given?

    m = @list.to_a
    m.length.times do |a|
      yield m[a]
    end
    self
  end
end

list = MyList.new(1, 2, 3, 4,5,6)
# Test #all?
result = list.all? { |e| e < 7 } # true
puts result
result = list.all? { |e| e > 7 } # false
puts result
result = list.all? # true
puts result

# Test #any?
result = list.any? { |e| e == 2 } # true
puts result
result = list.any? { |e| e == 5 } # false
puts result

# Test #filter
result = list.filter { |e| e&.even? } # 2, 4
puts result