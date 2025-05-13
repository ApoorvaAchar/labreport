class CreateCkEditorImages < ActiveRecord::Migration[7.2]
  def change
    create_table :ck_editor_images do |t|
      t.string :file
      t.integer :user_id
      t.integer :parent_id
      t.string :parent_type

      t.timestamps
    end
  end
end
