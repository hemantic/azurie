class Briefing < ActiveRecord::Base
  CATEGORIES = {
    :business => "Business & Cycles",
    :design => "Design & Creativity",
    :trends => "Trends & Progress"
  }
  has_attached_file :picture, :styles => { :medium => "480x480^", :small => "196x196^" },
    :storage => :s3, :bucket => 'azurie-briefings',
    :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET']
    }
  has_paper_trail
  belongs_to :user
  attr_accessible :title, :description, :category, :source, :is_quote, :picture
  validates :title, :presence => true
  validates :description, :presence => true
end
