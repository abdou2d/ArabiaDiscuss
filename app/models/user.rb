class User < ApplicationRecord
  include ImageUploader[:image]
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  def point_up
    self.points += 1
  end
  def point_down
    self.points -= 1
  end
end
