module ProductsHelper
  def product_lists(products)
    html = ''
    products.each do |product|
      html += render(partial: "product", locals: { product: product }) 
    end
    return raw(html)
  end
end
