# 代码生成时间: 2025-09-23 12:18:22
# math_tools.rb

# MathTools 提供了一系列数学计算功能
module MathTools
  # 计算两个数的和
  def self.add(a, b)
    a + b
  end

  # 计算两个数的差
  def self.subtract(a, b)
    a - b
  end

  # 计算两个数的乘积
  def self.multiply(a, b)
    a * b
  end

  # 计算两个数的商，返回商和余数
  def self.divide(a, b)
    if b == 0
      raise 'Division by zero is undefined.'
    else
      quotient = a / b
      remainder = a % b
      { quotient: quotient, remainder: remainder }
    end
  end

  # 计算一个数的平方
  def self.square(a)
    a ** 2
  end

  # 计算一个数的立方
  def self.cube(a)
    a ** 3
  end

  # 计算一个数的平方根，使用 Math.sqrt 提供支持
  def self.sqrt(a)
    Math.sqrt(a) if a >= 0
  end

  # 检查一个数是否为素数
  def self.prime?(n)
    return false if n <= 1
    (2..Math.sqrt(n)).none? { |i| n % i == 0 }
  end
end