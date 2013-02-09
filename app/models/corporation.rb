class Corporation < ActiveRecord::Base
  attr_accessible :incorporation_date, :name, :par_value, :shares
end
