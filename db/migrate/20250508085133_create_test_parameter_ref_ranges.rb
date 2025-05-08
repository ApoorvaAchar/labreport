class CreateTestParameterRefRanges < ActiveRecord::Migration[7.2]
  def change
    create_table :test_parameter_ref_ranges do |t|
      t.decimal :lower_limit
      t.decimal :upper_limit
      t.string :color
      t.string :result_type

      t.timestamps
    end
  end
end
