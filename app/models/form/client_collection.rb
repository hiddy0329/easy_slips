class Form::ClientCollection < Form::Base
  FORM_COUNT = 10 #ここで、作成したい登録フォームの数を指定
  attr_accessor :clients 

  def initialize(attributes = {})
    super attributes
    self.clients = FORM_COUNT.times.map { Client.new() } unless self.clients.present?
  end

  def clients_attributes=(attributes)
    self.clients = attributes.map { |_, v| Client.new(v) }
  end

  def save
    Client.transaction do
      self.clients.map do |client|
        if client.availability # ここでチェックボックスにチェックを入れている取引先のみが保存される
          client.save
        end
      end
    end
      return true
    rescue => e
      return false
  end
end