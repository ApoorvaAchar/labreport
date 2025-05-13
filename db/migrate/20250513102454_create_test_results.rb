class CreateTestResults < ActiveRecord::Migration[7.2]
  def change
    create_table :test_results do |t|
      t.string :patient_name
      t.jsonb :result
      t.string :pdf
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end
