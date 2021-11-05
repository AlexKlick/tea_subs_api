class TeaFacade
  def self.get_teas
    teas = TeaService.get_teas
    tea_arr = teas.map do |tea|
      TeaImport.new(tea)
    end
    tea_arr
  end
  def self.tea_search(keyword)
    
  end
end