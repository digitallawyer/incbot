class CreateCorporations < ActiveRecord::Migration
  def change
    create_table :corporations do |t|
      t.string :name
      t.string :shares
      t.string :par_value
      t.string :incorporation_date

      t.timestamps
    end
  end
end
