class Corporation < ActiveRecord::Base

  belongs_to :user
  
  attr_accessible :filing_date, 
        				  :name, 
        				  :par_value, 
        				  :shares,
        				  :incorporator_name,
        				  :incorporator_street,
        				  :incorporator_zip,
        				  :incorporator_city,
        				  :incorporator_state,
        				  :incorporator_country,
                  :user_id

  attr_writer :current_step


  validates_presence_of :name, :if => :name?
  validates_presence_of :par_value, :if => :shares?
  validates_presence_of :shares, :if => :shares?


  def name?
    current_step == "name"
  end


  def shares?
    current_step == "shares"
  end

  def current_step
    @current_step || steps.first
  end

  def steps
    %w[name shares incorporator date]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end

end
