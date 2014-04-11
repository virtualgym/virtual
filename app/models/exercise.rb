class Exercise < ActiveRecord::Base
  belongs_to :equipment

  mount_uploader :video, VideoUploader
  has_attached_file :avatar, :styles => { :medium => "200x200#", :thumb => "100x100#" }, :default_url => "/images/:style/exer.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
