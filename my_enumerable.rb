module MyEnumerable
  def list
    @list ||= []
  end

  def all?
    return unless block_given?

    response = true
    list.each do |element|
      response = false unless yield element
    end
    response
  end

  def any?
    return unless block_given?

    response = false
    list.each do |element|
      response = true if yield element
    end
    response
  end

  def filter
    return unless block_given?

    arr = []
    list.each do |element|
      arr.push(element) if yield element
    end
    arr
  end
end
