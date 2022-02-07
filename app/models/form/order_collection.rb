class Form::OrderCollection < Form::Base
  FORM_COUNT = 10 #ここで、作成したい登録フォームの数を指定
  attr_accessor :orders

  def initialize(attributes = {})
    super attributes
    self.orders = FORM_COUNT.times.map { Order.new() } unless self.orders.present?
  end

  def orders_attributes=(attributes)
    self.orders = attributes.map { |_, v| Order.new(v) }
  end

  def save
    Order.transaction do
      self.orders.map do |order|
        order.save
      end
    end
      return true
    rescue => e
      return false
  end
end
