class Update < ActiveRecord::Base
  belongs_to :user
  belongs_to :content, polymorphic: true
  #scope :current, order('created_at DESC') - (same as self.current below)
  
  def self.current
    order('created_at DESC')
  end
  
  def as_json(options)
    { 
      content_type: content,
      user: user.handle,
      content: content.as_json
    }
  end
  
  def self.search(query)
    if !query.to_s.strip.empty?
       joins("JOIN posts ON updates.content_type = 'POST' and updates.content_id = posts.id").where("posts.body LIKE ?", "%#{query}%").current
    #post.search(search_param).map(&:update)
    end
  end
end
