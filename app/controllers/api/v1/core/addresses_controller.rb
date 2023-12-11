class Api::V1::Core::AddressesController < ApplicationController
  before_action :authenticate_user!

  def retrive_district_mn_vdc_province
    @provinces = Core::Province.all
    @districts = Core::District.all
    @mn_vdcs = Core::MnVdc.all

    render json: {
             status: 200,
             message: "Data Fetched",
             data: {
               provinces: @provinces,
               districts: @districts,
               mn_vdcs: @mn_vdcs,
             },
           }
  end
end
