class Agent < ActiveRecord::Base
  attr_accessible :city, :country, :line1, :line2, :line3, :name, :postcode, :state
end
