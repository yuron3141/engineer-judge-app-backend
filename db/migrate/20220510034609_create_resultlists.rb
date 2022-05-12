class CreateResultlists < ActiveRecord::Migration[6.0]
  def change
    create_table :resultlists do |t|
      t.string :model
      t.string :etype
      t.integer :age
      t.integer :sex
      t.integer :month

      t.timestamps
    end
  end
end
