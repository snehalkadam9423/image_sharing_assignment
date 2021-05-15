# frozen_string_literal: true

class Album < ApplicationRecord # rubocop:todo Style/Documentation
  has_many :photos, dependent: :destroy
  belongs_to :user
  validates_presence_of :name
end
