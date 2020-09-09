class CompaniesController < ApplicationController
  def new
    @company = Company.new
    authorize @company
  end

  def create
    @company = Company.new(strong_params)
    authorize @company
    @company.user = current_user
      if @company.save
        redirect_to company_path(@company.id)
      else
        render :new
      end
  end

  def show
    @company = Company.find(params[:id])
    authorize @company
  end

  private

  def strong_params
    params.require(:company).permit(:name, :cnpj, :address)
  end
end
