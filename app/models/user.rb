class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of :email, :password

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
