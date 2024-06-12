class AddUserIdToMotivations < ActiveRecord::Migration[6.1]
  def change
    add_column :motivations, :user_id, :integer
  end
end
