class Post < ApplicationRecord
  enum status: { pending: 'pending', approved: 'approved', rejected: 'rejected' }
  # enum status: { approved: 0, rejected: 1, pending: 2 }

  # validates :status, presence: true
  belongs_to :user
  has_many :comments
  has_many :likes
  # def reject!(reason)
  #   update(status: 'rejected', rejected_reason: reason)
  #   # You can add any other custom logic you need for rejection
  # end
  
  def self.ransackable_attributes(auth_object = nil)
    ["name", "description", "status"]
  end

end
