class Identity

  include Mongoid::Document

  field :provider, type: String
  field :uid, type: String

  # validates :uid, presence: true, uniqueness: true
  index({ uid: 1, provider: 1 }, { unique: true })


  embedded_in :super_user
  embedded_in :user

end