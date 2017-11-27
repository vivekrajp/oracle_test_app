class Contact < ApplicationRecord
	acts_as_paranoid
	
	has_many :contact_phone_numbers, :dependent => :destroy
	has_many :contact_addresses, :dependent => :destroy

	accepts_nested_attributes_for :contact_phone_numbers, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :contact_addresses, reject_if: :all_blank, allow_destroy: true

	validates :name, presence: true

end
