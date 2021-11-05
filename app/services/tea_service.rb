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
    JSON.parse(response.body,symbolize_names: true)
  end
end