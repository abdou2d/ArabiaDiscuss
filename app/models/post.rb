class Post < ApplicationRecord
  acts_as_votable
  belongs_to :user
  belongs_to :Category
  def post_votes
    (self.get_upvotes.size - self.get_downvotes.size)
  end
end
