class Api::V1::Kyc::CustomersController < ApplicationController
  before_action :authenticate_user!

  def create
    ActiveRecord::Base.transaction do
      # creating customer first
      @customer = Kyc::Customer.new(set_customer)
      @customer.creator = current_user
      @customer.save
      # inserting data into kyc personal getting reference of customer into customer_id
      @kyc_personal = @customer.kyc_personals.build(set_kyc_personal)
      @kyc_personal.save
      # puts "kyc_personals ", @kyc_personal

      # # inserting kyc_contact if any
      if params.key?(:kyc_contacts) && !params[:kyc_contacts].blank?
        # @kyc_contact = @kyc_personal.kyc_contacts.insert_all(set_kyc_contact)
        set_kyc_contact.each do |contact|
          @kyc_contact = @kyc_personal.kyc_contacts.build(contact)
        end
      end

      # # inserting kyc_address if any
      if params.key?(:kyc_addresses) && !params[:kyc_addresses].blank?
        set_kyc_address.each do |address|
          @kyc_address = @kyc_personal.kyc_addresses.build(address)
          # @kyc_address.save
        end
      end

      if @customer.valid? && @kyc_personal.valid? && (@kyc_address.save || @kyc_address.nil?) && (@kyc_contact.save || @kyc_contact.nil?)
        render json: {
                 status: 201,
                 data: [
                   {
                     "customer": @customer,
                     "kyc_personal": @kyc_personal,
                     "kyc_contact": @kyc_personal.kyc_contacts,
                     "kyc_address": @kyc_personal.kyc_addresses,
                   },
                 ],
               }, status: :created
      else
        render json: {
                 status: 422,
                 message: "Profile Registration failed!!",
                 data: @customer.errors.full_messages +
                       @kyc_personal.errors.full_messages +
                       (@kyc_contact&.errors&.full_messages || []) +
                       (@kyc_address&.errors&.full_messages || []),
               }, status: :unprocessable_entity
        # Rollback the transaction explicitly
        raise ActiveRecord::Rollback
      end
    end
  rescue StandardError => e
    render json: {
             status: 500,
             message: "Profile Registration failed!!",
             data: [e.cause.nil? ? e.message : e.cause],
           }, status: :internal_server_error
  end

  private

  def get_new_profile_id
    max_profile_id = Kyc::Customer.maximum("COALESCE(profile_id, 0)") || 0
    max_profile_id + 1
  end

  def set_customer
    params.require(:customer).permit(:introduced_date, :branch_id).merge!({ profile_id: get_new_profile_id })
  end

  def set_kyc_personal
    params.require(:kyc_personal).permit(:is_minor, :is_residential, :salutation, :first_name, :middle_name, :last_name, :gender, :date_of_birth, :email, :maritial_status, :pan_number, :nea_customer_id, :khanepani_customer_id, :voting_address, :qualification)
  end

  def set_kyc_contact
    params.require(:kyc_contacts).map { |contact| contact.permit(:contact_type, :contact_number, :contact_relation) }
  end

  def set_kyc_address
    params.require(:kyc_addresses).map { |address| address.permit(:address_type, :province, :district, :mn_vdc, :ward_no, :street, :tole_name) }
  end
end
