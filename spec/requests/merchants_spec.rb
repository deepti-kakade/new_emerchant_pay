require 'rails_helper'

RSpec.describe "Merchants", type: :request do
  let(:merchants) { create_list(:merchant, 3) }
  let(:admin) { create(:admin)}
  let(:merchant) { create(:merchant)}
  let(:merchant_1) { create(:merchant)}

  describe "GET /index" do


    context 'successful responses' do
      before do
        sign_in(admin)
      end
      it 'returns all posts when user is authorized' do
        get merchants_path

        expect(response.status).to eq(200)
        assert assigns(:merchants)
        expect(response).to render_template "index"
        end
    end

    context 'unsuccessful responses' do
      it 'redirects user when they are not logged in' do
        get merchants_path

        expect(response.status).to eq(302)
      end
    end
  end

  describe "GET /show" do

    context 'admin can view merchant' do
      before do
        sign_in(admin)
      end

      it 'returns merchant details' do
        get merchant_path(merchant.id)

        expect(response.status).to eq(200)
        assert assigns(:merchant)
        expect(response).to render_template "show"
      end
    end

    context 'merchant can view his details' do
      before do
        sign_in(merchant)
      end

      it 'returns merchant details' do
        get merchant_path(merchant.id)

        expect(response.status).to eq(200)
        assert assigns(:merchant)
        expect(response).to render_template "show"
      end
    end

    context 'merchant can not see others details' do
      before do
        sign_in(merchant)
      end

      it 'returns merchant details' do

        expect do
          get merchant_path(merchant_1.id)
        end.to raise_error Pundit::NotAuthorizedError
      end
    end

    context 'unsuccessful responses' do
      it 'redirects user when they are not logged in' do
        get merchant_path(merchant.id)

        expect(response.status).to eq(302)
      end
    end
  end

  describe "DELETE /destroy" do
    context 'successful responses' do
      before do
        sign_in(admin)
      end
      it 'destroy merchant' do
        delete merchant_path(merchant.id)
        expect(response).to redirect_to merchants_path
      end
    end
    context 'merchant can not detsroy record' do
      before do
        sign_in(merchant)
      end
      it 'retrun error' do
        expect do
          delete merchant_path(merchant_1.id)
        end.to raise_error Pundit::NotAuthorizedError
      end
    end

    context 'unsuccessful responses' do
      it '302 response when they are not logged in' do
        delete merchants_path(merchant_1.id)

        expect(response.status).to eq(401)
      end
    end
  end
end
