class RenameDidYouKnow < ActiveRecord::Migration[7.2]
  def change
    rename_column :test_parameters, :did_you_konw, :did_you_know
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
