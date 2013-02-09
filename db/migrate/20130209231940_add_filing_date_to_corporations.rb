class AddFilingDateToCorporations < ActiveRecord::Migration
  def change
    add_column :corporations, :filing_date, :date
  end
end
