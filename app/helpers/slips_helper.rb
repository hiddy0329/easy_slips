module SlipsHelper
  def slip_lists(slips)
    html = ''
    slips.each do |slip|
      html += render(partial: "slip", locals: { slip: slip }) 
    end
    return raw(html)
  end
end
