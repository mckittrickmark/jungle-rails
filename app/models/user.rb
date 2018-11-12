class User < ActiveRecord::Base
  has_secure_password
  has_many :ratings

  before_validation :email_validation

  validates :email, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}

  def self.authenticate_with_credentials(email, password)
    email = self.login_email_validation(email)

    user = User.find_by_email(email)

    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end


  private
  def email_validation
    self.email = email.downcase
  end

  def self.login_email_validation(email)
    email.delete(' ').downcase
  end

end
