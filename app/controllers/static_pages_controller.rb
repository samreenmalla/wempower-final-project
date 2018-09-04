class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def donation
    @donations = Donation.all
  end
end
