class ContactsController < ApplicationController

	##
	# Index
	# Show all contacts
	def index
		@contacts = Contact.all
	end
		
	##
	# New
	# Add new contact	
	def new
		@contact = Contact.new
		@contact.contact_phone_numbers.build
		@contact.contact_addresses.build
	end

	##
	# Create
	# Create a contact
	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			flash[:notice] = "Contact sucessfully saved!"
			redirect_to contacts_path
	  	else
	  		flash[:error] = "Contact could not save!"
	  		@contact.contact_phone_numbers.build unless @contact.contact_phone_numbers.present?
	  		@contact.contact_addresses.build unless @contact.contact_addresses.present?
	    	render 'new'
	  	end
	end

	##
	# Edit
	# Params {id: Numberic}
	# Edit contact details
	def edit
		@contact = Contact.find(params[:id])
		@contact.contact_phone_numbers.build unless @contact.contact_phone_numbers.present?
	  	@contact.contact_addresses.build unless @contact.contact_addresses.present?
	end

	##
	# Update
	# Params {id: Numberic}
	# Update contact details
	def update
		@contact = Contact.find(params[:id])
		if @contact.update_attributes(contact_params)
			flash[:notice] = "Contact sucessfully saved!"
			redirect_to contacts_path
	  	else
	  		flash[:error] = "Contact could not save!"
	  		@contact.contact_phone_numbers.build unless @contact.contact_phone_numbers.present?
	  		@contact.contact_addresses.build unless @contact.contact_addresses.present?
	    	render 'edit'
	  	end
	end

	##
	# Update
	# Params {id: Numberic}
	# Show contact details
	def show
		@contact = Contact.find(params[:id])
	end

	##
	# Destroy
	# Params {id: Numberic}
	# Delete contact details
	def destroy
		@contact = Contact.find(params[:id])
		@contact.destroy
		flash[:notice] = "Contact sucessfully deleted!"
		redirect_to contacts_path
	end	

	private

	def contact_params
		params.require(:contact).permit(:name, contact_phone_numbers_attributes: [:phone_type, :number, :id, :_destroy], contact_addresses_attributes: [:address_type, :address, :id, :_destroy])
	end
end
