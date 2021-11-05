class TeaImport
  attr_reader :title, :description, :temperature, :brew_time

  def initialize(tea)
    @title = tea[:name]
    @description = tea[:description]
    @brew_time = tea[:brew_time]
    @temperature = tea[:temperature]
  end
end