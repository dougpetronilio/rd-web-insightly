class LeadsController < ApplicationController
  before_action :authenticate

  def index
    @title = 'Lista de Leads'
    @leads = Lead.all
  end

  def new
    @title = 'Cadastro de Lead'
    @lead = Lead.new
  end

  def edit
    @lead = Lead.find params[:id]
  end

  def destroy
    lead = Lead.find params[:id]
    lead.delete
    redirect_to '/leads/index'
  end

  def save
    if params[:id] && params[:id] != ''
      lead = RdInsightly::Lead.find params[:id]
      lead.update params
    else
      RdInsightly::Lead.create params[:last_name], name: params[:name], email: params[:email], company: params[:company], job_title: params[:job_title], phone: params[:phone], website: params[:website]
    end
    redirect_to '/leads/index'
  rescue
    redirect_to '/leads/index'
  end

  protected
  def authenticate 
    redirect_to '/home/index' unless session[:token] && RdInsightly.authorized?
    RdInsightly.token = session[:token]
  end
end
