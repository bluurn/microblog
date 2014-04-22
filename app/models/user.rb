class User < ActiveRecord::Base
  validates :name, :email, presence: true
  validates :name, length: { maximum: 50 }
end
