class CreateSubmits < ActiveRecord::Migration[6.0]
  def change
    create_table :submits do |t|
      t.string :ip_address, :null => false
      t.integer :point_intention
      t.integer :point_view
      t.integer :point_expert
      t.integer :point_tech
      t.integer :generation
      t.integer :sex , :default => 0
      t.integer :month

      t.timestamps
    end
  end
end
