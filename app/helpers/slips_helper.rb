module SlipsHelper
  def slip_lists(slips)
    html = ''
    slips.each do |slip|
      html += render(partial: "slip", locals: { slip: slip }) 
    end
    return raw(html)
  end

  def slip_order_lists(orders)
    html = ''
    orders.each do |order| 
      html += render(partial: "slip_order", locals: { order: order }) 
    end
    return raw(html)
  end
end
