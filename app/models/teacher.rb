class Teacher < ActiveRecord::Base
  has_many :parents
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, :length => { :minimum=> 6}
  validates_confirmation_of :password
  has_secure_password


end
