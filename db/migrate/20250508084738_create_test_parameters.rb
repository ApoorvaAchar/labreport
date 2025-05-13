class CreateTestParameters < ActiveRecord::Migration[7.2]
  def change
    create_table :test_parameters do |t|
      t.integer :lab_test_id
      t.string :description
      t.string :name
      t.string :key
      t.text :cause_effect
      t.text :what_can_do
      t.text :did_you_konw

      t.timestamps
    end
    add_index :test_parameters, :lab_test_id
  end
end
