# frozen_string_literal: true

class MerchantsController < ApplicationController
  skip_before_action :authenticate_user
  before_action :merchant, except: [:index]

  def index
    # We can use pagination here.
    @merchants = Merchant.all
  end
  
  def show
  end

  def edit
  end

  def update
    if @merchant.update_attributes(merchant_params)   
      flash[:notice] = 'Merchant updated!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to edit merchant!'   
      render :edit   
    end
  end

  def destroy
    if @merchant.destroy   
      flash[:notice] = 'Merchant deleted!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to delete this merchant!'   
      render :destroy   
    end   
  end

  private

    def merchant_params
      params.require(:merchant).permit(:name, :email, :password, :description)
    end

    def merchant
      @_merchant ||= Merchant.find_by!(id: params[:id])
    end
end