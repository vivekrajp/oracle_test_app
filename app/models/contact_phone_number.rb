class ContactPhoneNumber < ApplicationRecord
	acts_as_paranoid
	
	belongs_to :contacts, optional: true

	validates :phone_type, presence: { message: 'Phone type must exist' }
	validates :number, presence: { message: 'Phone number must exist' }
	validates :number, numericality: { message: 'Phone number should be numeric' }
	
end
