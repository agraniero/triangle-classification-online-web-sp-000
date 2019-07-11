class Triangle
  attr_reader :side1, :b, :c
  def initialize(side1, b, c)
    @side1 = side1
    @b = b
    @c = c
  end

  def kind
    validate_triangle
    if side1 == b && b == c
      :equilateral
    elsif side1 == b || b == c || side1 == c
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    real_triangle = [(side1 + b > c), (side1 + c > b), (b + c > side1)]
    [side1, b, c].each { |s| real_triangle << false if s <= 0 }
    raise TriangleError if real_triangle.include?(false)
  end

  class TriangleError < StandardError
  end

end