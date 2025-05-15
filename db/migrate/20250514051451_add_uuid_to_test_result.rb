class AddUuidToTestResult < ActiveRecord::Migration[7.2]
  def change
    add_column :test_results, :uuid, :string
    add_index :test_results, :uuid
  end
end
