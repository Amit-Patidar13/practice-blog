class AddRejectReasonToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :rejected_reason, :text
  end
end
