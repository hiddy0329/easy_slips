module ClientsHelper
  def client_lists(clients)
    html = ''
    clients.each do |client|
      html += render(partial: "client", locals: { client: client }) 
    end
    return raw(html)
  end
end
