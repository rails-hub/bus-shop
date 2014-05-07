class Stat < ActiveRecord::Base
  belongs_to :bus
  
  def self.visits_on(date, bus_id)
    begin
      return self.where(:date => date.to_s).where(:bus_id => bus_id).first.visits
    rescue
      return 0
    end
  end
end
