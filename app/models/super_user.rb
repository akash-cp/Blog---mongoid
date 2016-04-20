class SuperUser
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :omniauthable

  field :username, type: String, default: ""

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time


  embeds_many :identities

  ##callbacks

  # add_index :devise, :provider
  # add_index :devise, :uid
  # add_index :devise, [:provider, :uid], unique: true


  def self.from_omniauth(auth)
    params = auth.slice(:provider, :uid)
    u = SuperUser.find_or_create_by(email: auth.info.email) do |user|
      o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
      string = (0...10).map { o[rand(o.length)] }.join
      user.username = auth.info.name
      user.password = string
      user.email = auth.info.email
      user.identities.new(uid: auth.uid, provider: auth.provider)
    end
    return  u
  end


  def self.new_with_session(params, session)
    if session['devise.user_attributes']
      new(session['devise.user_attributes']) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end


  # def password_required?
  #   super && provider.blank?
  # end
  #
  # private
  #
  # def create_identities(auth)
  #   self.identities.new(uid: auth.uid, provider: auth.provider)
  # end
end
