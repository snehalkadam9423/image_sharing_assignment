class User < ApplicationRecord
  has_many :albums, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates_presence_of :name
end
