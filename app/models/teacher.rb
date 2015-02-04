class Teacher < ActiveRecord::Base
  has_many :parents
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password
end
