class CreateParameterRefRanges < ActiveRecord::Migration[7.2]
  def change
    create_table :parameter_ref_ranges do |t|
      t.integer :test_parameter_id
      t.decimal :lower_limit
      t.decimal :upper_limit
      t.string :color
      t.string :result_type

      t.timestamps
    end
    add_index :parameter_ref_ranges, :test_parameter_id
  end
end
