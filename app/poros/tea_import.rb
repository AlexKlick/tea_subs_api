class TeaImport
  attr_reader :title, :description, :temperature, :brew_time, :id

  def initialize(tea)
    @title = tea[:name]
    @description = tea[:description]
    @brew_time = tea[:brew_time]
    @temperature = tea[:temperature]
    @id = tea[:_id]
  end
end