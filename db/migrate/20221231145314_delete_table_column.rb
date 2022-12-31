class DeleteTableColumn < ActiveRecord::Migration[6.0]
  def change
    #カラムの削除
    remove_column :type_a1_statistics, :generation, :integer
    remove_column :type_a2_statistics, :generation, :integer
    remove_column :type_b1_statistics, :generation, :integer
    remove_column :type_b2_statistics, :generation, :integer
    remove_column :type_c1_statistics, :generation, :integer
    remove_column :type_c2_statistics, :generation, :integer
    remove_column :type_d1_statistics, :generation, :integer
    remove_column :type_d2_statistics, :generation, :integer
    remove_column :type_e1_statistics, :generation, :integer
    remove_column :type_e2_statistics, :generation, :integer
  end
end
