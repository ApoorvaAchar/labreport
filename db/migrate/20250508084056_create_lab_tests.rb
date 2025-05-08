class CreateLabTests < ActiveRecord::Migration[7.2]
  def change
    create_table :lab_tests do |t|
      t.string :name
      t.string :key
      t.text :description

      t.timestamps
    end
  end
end
