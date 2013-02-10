class Corporation < ActiveRecord::Base
  attr_accessible :filing_date, :name, :par_value, :shares
  validates :name, :presence => true, :uniqueness => true
  validates :filing_date, :presence => true
  validates :par_value, :presence => true, :format => {:with => /^[-.,0-9]+$/}
  validates :shares, :presence => true, :format => {:with => /^[-.,0-9]+$/}
end
