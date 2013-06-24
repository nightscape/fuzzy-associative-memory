require 'lib/fuzzy_set'

class Triangle < FuzzySet

  attr_reader :left, :peak, :right, :height

  def initialize(left, peak, right, height=1.0)
    # TODO validations

    @peak         = peak
    @left         = left
    @right        = right
    @height       = height
    @left_subdiv  = @height / (@peak - @left)
    @right_subdiv = -@height / (@peak - @right)
  end

  def dom(value)
    if value < @left
      0.0
    elsif value < @peak
      (value - @left) * @left_subdiv
    elsif value < @right
      (@right - value) * @right_subdiv
    else
      0.0
    end
  end

end