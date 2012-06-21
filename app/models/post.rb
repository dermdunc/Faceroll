class Post < ActiveRecord::Base
  has_one :update, as: :content
  validates :body, presence: true
  #validates_presence_of :body
  
  def as_json(options = {})
    { body: body }
  end
end
