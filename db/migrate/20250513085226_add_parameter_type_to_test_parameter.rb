class AddParameterTypeToTestParameter < ActiveRecord::Migration[7.2]
  def change
    add_column :test_parameters, :parameter_type, :string, default: 'number'

    add_column :parameter_ref_ranges, :result, :string
  end
end
