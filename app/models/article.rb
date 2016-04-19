class Article
  include Mongoid::Document

  field :title, type: String
  field :content, type: String
  field :date, type: String
  # field :avatar, type: String
  mount_uploader :avatar, AvatarUploader

  validates :title, presence: true
  validates :content, presence: true
  validates :date, presence: true


 # embedded_in :user
end
