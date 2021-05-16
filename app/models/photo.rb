class Photo < ApplicationRecord
	has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
	validates_attachment :image, presence: true
	validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
	validates_presence_of :tagline
end