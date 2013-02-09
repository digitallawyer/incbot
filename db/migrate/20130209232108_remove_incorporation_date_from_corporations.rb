class RemoveIncorporationDateFromCorporations < ActiveRecord::Migration
  def up
    remove_column :corporations, :incorporation_date
  end

  def down
    add_column :corporations, :incorporation_date, :string
  end
end
