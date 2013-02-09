class Corporation < ActiveRecord::Base
  attr_accessible :filing_date, :name, :par_value, :shares
  validates_presence_of :filing_date, :name, :par_value, :shares

end
