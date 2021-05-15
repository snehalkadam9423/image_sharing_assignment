# frozen_string_literal: true

class Photo < ApplicationRecord # rubocop:todo Style/Documentation
	belongs_to :album
	has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
	validates_attachment :image, presence: true
	validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
	validates_presence_of :tagline
	validate :validate_images_number, on: :create

	def validate_images_number
		if album.photos.length >= 25 # rubocop:todo Style/GuardClause
			errors.add(:image, 'You can add max 25 photos per album')
		end
	end
end