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

class User < ActiveRecord::Base
  attr_accessible :name, :email
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name, :presence => true
  validates :name, :length => { :maximum => 50 }
  
  validates :email, :presence => true
  validates :email, :format => { :with => email_regex }
  validates :email, :uniqueness => { :case_sensitive => false }
  
end
