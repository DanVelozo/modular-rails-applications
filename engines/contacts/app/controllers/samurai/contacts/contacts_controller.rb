require_dependency "samurai/application_controller"

module Samurai::Contacts
  class ContactsController < ApplicationController
    before_action :set_contact, only: [:show, :edit, :update, :destroy]
    authorize_resource class: Samurai::Contacts::Contact

    def index
      @contacts = Contact.all
    end

    def show
    end

    def new
      @contact = Contact.new
    end

    def edit
    end

    def create
      @contact = Contact.new(contact_params)
      @contact.user = current_user
      if @contact.save
        redirect_to [samurai, @contact],
                    notice: 'Contact was successfully created.'
      else
        render :new
      end
    end

    def update
      if @contact.update(contact_params)
        redirect_to [samurai, @contact],
                    notice: 'Contact was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @contact.destroy
      redirect_to samurai.contacts_url,
                  notice: 'Contact was successfully destroyed.'
    end

    private
      def set_contact
        @contact = Contact.find(params[:id])
      end

      def contact_params
        params.require(:contact).permit(:first_name, :last_name, :company,
                                        :email, :phone, :user_id)
      end
  end
end
