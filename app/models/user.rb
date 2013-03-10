require 'digest/sha1'
class User < ActiveRecord::Base

  # attr_accessible :title, :body

attr_accessor :password

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

#validations

  validates :username, :length => { :within => 5..25 }, :uniqueness => true
  validates :email, :presence => true, :length => { :maximum => 100 }, 
    :format => EMAIL_REGEX, :confirmation => true

  # only on create, so other attributes of this user can be changed
  validates_length_of :password, :within => 3..25, :on => :create

  before_save :create_hashed_password
  after_save :clear_password

  attr_protected :hashed_password, :salt

#called everytime a user attempts login
  def self.authenticate(username="", password="")
    user = User.find_by_username(username)
    if user && user.password_match?(password)
      return user
    else
      return false
    end
  end

  # The same password string with the same hash method and salt
  # should always generate the same hashed_password.

  def password_match?(password="")
    hashed_password == User.hash_with_salt(password, salt)
  end

  def self.make_salt(username="")
    Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
  end

  def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end

  private

  def create_hashed_password
    # Whenever :password has a value hashing is needed
    unless password.blank?
      # always use "self" when assigning values
      self.salt = User.make_salt(username) if salt.blank?
      self.hashed_password = User.hash_with_salt(password, salt)
    end
  end

  def clear_password
    # for security and b/c hashing is not needed
    self.password = nil
  end


end
