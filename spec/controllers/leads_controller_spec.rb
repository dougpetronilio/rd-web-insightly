require 'rails_helper'

RSpec.describe LeadsController, type: :controller do
  before { RdInsightly.create_authorization TOKEN }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    before { RdInsightly::Lead.create 'teste' }
    it "returns http success" do
      get :edit, id: RdInsightly::Lead.all.last.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    before { RdInsightly::Lead.create 'teste' }
    it "returns http redirect" do
      delete :destroy, id: RdInsightly::Lead.all.last.id
      expect(response.status).to be 302 
      expect(response).to redirect_to action: :index
    end
  end

  describe "GET #save" do
    it "returns http redirect success to save lead" do
      post :save, id: RdInsightly::Lead.all.last.id, name: 'name changed', last_name: 'last name changed' 
      expect(response.status).to be 302 
      expect(response).to redirect_to action: :index
    end 

    it "returns http redirect success to create new lead" do
      post :save, name: 'name changed', last_name: 'last name changed' 
      expect(response.status).to be 302 
      expect(response).to redirect_to action: :index
    end 
  end
end
