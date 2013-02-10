class AddIncorporatorToCorporations < ActiveRecord::Migration
  def change
    add_column :corporations, :incorporator_name, :string
    add_column :corporations, :incorporator_street, :string
    add_column :corporations, :incorporator_zip, :string
    add_column :corporations, :incorporator_city, :string
    add_column :corporations, :incorporator_state, :string
    add_column :corporations, :incorporator_country, :string
  end
end
