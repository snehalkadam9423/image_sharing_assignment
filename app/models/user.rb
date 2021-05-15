# frozen_string_literal: true

class User < ApplicationRecord # rubocop:todo Style/Documentation
  has_many :albums, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates_presence_of :name
end
