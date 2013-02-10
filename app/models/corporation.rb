class Corporation < ActiveRecord::Base
  attr_accessible :filing_date, 
  				  :name, 
  				  :par_value, 
  				  :shares,
  				  :incorporator_name,
  				  :incorporator_street,
  				  :incorporator_zip,
  				  :incorporator_city,
  				  :incorporator_state,
  				  :incorporator_country

  validates :name, :presence => true, :uniqueness => true
  validates :filing_date, :presence => true
  validates :par_value, :presence => true, :format => {:with => /^[-.,0-9]+$/}
  validates :shares, :presence => true, :format => {:with => /^[-.,0-9]+$/}
end
