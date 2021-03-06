class Setting < ActiveRecord::Base
  class << self
    def put(name, value)
      Setting.where(name: name).first_or_create.update_attribute(:value, value)
    end

    def get(name)
      Setting.where(name: name).first.try(:value)
    end
  end
end
