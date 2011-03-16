# == Schema Information
# Schema version: 20110314141400
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#
require 'digest'
class User < ActiveRecord::Base
  attr_accessor :password
  
  # The following attributes are accessible by the user
  attr_accessible :name, :email, :password, :password_confirmation
  
  # Encrypts Password before saving user to database
  before_save :encrypt_password
  
  # Return true if the user's password matches the submitted password.
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end
  # Password Encryption
  private
  
  def encrypt_password
    self.salt = make_salt if new_record?
    self.encrypted_password = encrypt(password)
  end
  
  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end
  
  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end
  
  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end



  # Email Formatting
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  # Validateds name and email
  validates :name, :presence => true
  validates :name, :length => { :maximum => 50 }
  
  validates :email, :presence => true
  validates :email, :format => { :with => email_regex }
  validates :email, :uniqueness => { :case_sensitive => false }
  
  # Automatically create the virtual attribute 'password_confirmation'.
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 6..40 }
                       
  
end
