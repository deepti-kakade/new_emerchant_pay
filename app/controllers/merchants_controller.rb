# frozen_string_literal: true

class MerchantsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_merchant, except: [:index]

  def index
    # We can use pagination here.
    authorize Merchant

    @merchants = Merchant.all
  end
  
  def show
    authorize @merchant
  end

  def edit
    authorize @merchant
  end

  def update
    authorize @merchant

    if @merchant.update_attributes(merchant_params)   
      flash[:notice] = 'Merchant updated!'   
      redirect_to root_path
    else   
      flash[:error] = 'Failed to edit merchant!'   
      render :edit   
    end
  end

  def destroy
    authorize @merchant

    if @merchant.destroy   
      flash[:notice] = 'Merchant deleted!'   
      redirect_to merchants_path
    else   
      flash[:error] = 'Failed to delete this merchant!'   
      render :destroy   
    end   
  end

  private

    def merchant_params
      params.require(:merchant).permit(:name, :email, :password, :description)
    end

    def find_merchant
      @merchant ||= Merchant.find_by!(id: params[:id])
    end
end
