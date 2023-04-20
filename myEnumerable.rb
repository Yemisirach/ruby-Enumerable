module MyEnumerable
  def all?
    each { |item| return false unless block_given? ? yield(item) : item }
    true
  end

  def any?
    each { |item| return true if block_given? ? yield(item) : item }
    false
  end

  def filter
    select { |item| block_given? ? yield(item) : item }
  end
end