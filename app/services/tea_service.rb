class TeaService
  def self.conn
    Faraday.new(
      url: 'https://tea-api-vic-lo.herokuapp.com/',
      params: {  },
      headers: {
        'Content-Type' => 'application/json',
        'Accept-Version' => 'v1'
      }
    )
  end

  def self.get_teas
    response = conn.get('/tea')
    teas = JSON.parse(response.body,symbolize_names: true)
    binding.pry
    Tea.new(teas[0])
  end
end