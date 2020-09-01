class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(strong_params)
    @company.user = current_user
      if @company.after_save 
        redirect_to company_path(@company.id)
      else
        render :new
      end
  end

  def show
    @company = Company.find(params[:id])
  end

  private

  def strong_params
  params.require(:company).permit(:name, :cnpj)
  end
end
