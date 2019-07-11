class Triangle
  attr_reader :side_a, :b, :c
  def initialize(side_a, b, c)
    @side_a = side_a
    @b = b
    @c = c
  end

  def kind
    validate_triangle
    if side_a == b && b == c
      :equilateral
    elsif side_a == b || b == c || side_a == c
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    real_triangle = [(side_a + b > c), (side_a + c > b), (b + c > side_a)]
    [side_a, b, c].each { |s| real_triangle << false if s <= 0 }
    raise TriangleError if real_triangle.include?(false)
  end

  class TriangleError < StandardError
  end

end