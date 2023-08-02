class AddDefaultStatusToPosts < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :status, :string, default: 'pending'
  end
end
