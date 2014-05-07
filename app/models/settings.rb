class Settings < ActiveRecord::Base
  serialize :value

  def self.get(setting)
    begin
      @row =  self.find_by_setting_type(setting)
      return @row.value
    rescue
      raise SettingsTableEmpty
    end
  end
end
