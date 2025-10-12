# 代码生成时间: 2025-10-13 02:22:33
# customer_relationship_management.rb

# 客户关系管理系统
class CustomerRelationshipManagement
  # 客户类
  class Customer
    attr_accessor :id, :name, :email, :phone
    
    # 初始化客户信息
    def initialize(id:, name:, email:, phone:)
      @id = id
      @name = name
      @email = email
      @phone = phone
    end
    
    # 格式化输出客户信息
    def to_s
      "Customer #{id}: #{name}, Email: #{email}, Phone: #{phone}"
    end
  end

  # 客户管理类
  class CustomerManager
    include Enumerable
    
    attr_reader :customers
    
    # 初始化客户管理器
    def initialize
      @customers = []
    end
    
    # 添加客户
    def add_customer(customer)
      raise ArgumentError, 'Customer must be an instance of Customer' unless customer.is_a?(Customer)
      @customers << customer
    end
    
    # 查找客户
    def find_customer(id)
      @customers.find { |customer| customer.id == id }
    end
    
    # 删除客户
    def remove_customer(id)
      customer = find_customer(id)
      @customers.delete(customer) if customer
    end
    
    # 更新客户信息
    def update_customer(id, **updates)
      customer = find_customer(id)
      return 'Customer not found' unless customer
      updates.each { |key, value| customer.send(