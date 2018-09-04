class DonationsController < ApplicationController
		
	def index
    @donations = Donation.all
  end
  
  def create
		@donation = Donation.create(donation_params[:id])
	end

	def show
		@donations = Donation.find(params[:id])
	end
	
	private
	def donation_params
		params.require(:donation).permit(:Roll_No, :Name , :Faculty, :Year, :Contact_Number, :Donation_quantity)
	 end
  
end
