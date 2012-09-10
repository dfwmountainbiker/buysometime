class User < ActiveRecord::Base
  belongs_to :client
  has_many :authentications

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # I took out :validatable

 # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

 def to_key
    new_record? ? nil : [ self.send(self.class.primary_key) ]
  end


  def apply_omniauth(omniauth)
    case omniauth['provider']
    when 'facebook'
      self.apply_facebook(omniauth)
    end
    #authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
    #logger.debug "Here is the token #{omniauth['credentials']['token']}"
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'], :token =>(omniauth['credentials']['token'] rescue nil))
  end

 #def facebook
   #@fb_user ||= FbGraph::User.me(self.authentications.find_by_provider('facebook').token)
 #end

 protected

  def apply_facebook(omniauth)
    #if (extra = omniauth['extra']['user_hash'] rescue false)
    #  self.email = (extra['email'] rescue '')
    #  self.name = (extra['name'] rescue '')
    #  self.gender = (extra['gender'] rescue '')
    #end
   
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

end

