class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :name
      t.string :line1
      t.string :line2
      t.string :line3
      t.string :city
      t.string :postcode
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
