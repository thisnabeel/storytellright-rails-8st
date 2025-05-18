class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # acts_as_token_authenticatable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stories
  has_many :songs

  has_many :companies

  # has_many :production_users
  # has_many :productions, through: :production_users
  has_many :productions


  def generate_temporary_authentication_token
    # self.authentication_token = Devise.friendly_token
    token = Devise.friendly_token
    tokens = (self.tokens || []).push(token)
    self.update(tokens: tokens)
    return token
  end

  def clear_temporary_authentication_token
    self.authentication_token = nil
    self.save
  end

  def self.is_admin? user
    if user.present?
      array = ["rockystorm@gmail.com"]
      bool = false
      array.each do |a|
        if user.email.include? a
          return true
        else
        end
      end
      return bool
    else
      return false
    end
  end

  def admin?
    User.is_admin? self
  end

  # 
  # def companies
  #   pr = self.productions.where(productionable_type: nil)
  #   pru = ProductionUser.where(user_id: self.id)
  #           .pluck(:production_id).uniq
  #   return pr + Production.where(id: pru).where(productionable_type: nil)
  # end

  # 
  def self.authenticate(email, password)
    user = User.find_for_authentication(:email => email)
    user&.valid_password?(password) ? user : nil
  end

end
