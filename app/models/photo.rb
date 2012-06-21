class Photo < ActiveRecord::Base
  has_one :update, as: :content
  has_attached_file :upload, styles: { thumb: "200x200" }
  
  def as_json(options = {})
    { url: upload.url }
  end
end
