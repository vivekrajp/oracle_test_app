class ContactAddress < ApplicationRecord
	acts_as_paranoid
	
	belongs_to :contacts, optional: true

	validates :address_type, presence: { message: 'Contact type must exist' }
	validates :address, presence: { message: 'Contact address must exist' }
end
