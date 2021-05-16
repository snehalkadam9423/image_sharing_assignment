class Album < ApplicationRecord
	has_many :photos, dependent: :destroy
	belongs_to :user
	validates_presence_of :name
	accepts_nested_attributes_for :photos, allow_destroy: true, update_only: true
	validate :validate_images_number

	def validate_images_number
		errors.add(:base, 'You can add max 25 photos per album') if photos.length >= 25
	end
end
