class User < ActiveRecord::Base
  acts_as_paranoid

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :confirmable, :token_authenticatable

  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :remember_me

  has_many :services  

  def self.find_facebook_omniauth(access_token, signed_in_resource=nil)
    data = access_token['user_info']

    if user = User.find_by_email(data['email'])
      user
    else # Create a user with a stub password. 
      user = User.new(:email => data['email'], :first_name => data['first_name'],
                   :last_name => data['last_name'], :password => Devise.friendly_token[0,20])
      user.skip_confirmation!
      user.save
      user.confirm!
      user
    end
  end

  def self.find_for_google_apps_open_id(access_token, signed_in_resource=nil)
    data = access_token['user_info']

    if user = User.find_by_email(data['email'])
      user
    else # Create a user with a stub password. 
      user = User.new(:email => data['email'], :first_name => data['first_name'], 
                   :last_name => data['last_name'], :password => Devise.friendly_token[0,20]) 
      user.skip_confirmation!
      user.save
      user.confirm!
      user
    end
  end


end
