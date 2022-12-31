class CreateTypeC2Statistics < ActiveRecord::Migration[6.0]
  def change
    create_table :type_c2_statistics do |t|
      t.integer "generation"
      t.integer "sum", default: 0
      
      t.timestamps
    end
  end
end
