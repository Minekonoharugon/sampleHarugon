class Like < ApplicationRecord
  belongs_to :dog
  belongs_to :user
  validates_uniqueness_of :dog_id, scope: :user_id
end
