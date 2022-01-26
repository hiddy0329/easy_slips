class Form::ItemCollection < Form::Base
  FORM_COUNT = 10 #ここで、作成したい登録フォームの数を指定
  attr_accessor :items

  def initialize(attributes = {})
    super attributes
    self.items = FORM_COUNT.times.map { Item.new() } unless self.items.present?
  end

  def items_attributes=(attributes)
    self.items = attributes.map { |_, v| Item.new(v) }
  end

  def save
    Item.transaction do
      self.items.map do |item|
        if item.availability # ここでチェックボックスにチェックを入れている商品のみが保存される
          item.save
        end
      end
    end
      return true
    rescue => e
      return false
  end
end