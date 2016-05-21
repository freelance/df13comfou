include TimeSeriesInitializer

class ObjetivosController < ApplicationController
  def index
    @objetivos = Objetivo.by_last_updated.page(params[:page]).per(7)
    @hours_entry = Hora.new
    @activities = Hora.by_last_created_at.limit(30)
  end

  def show
   @time_series = time_series_for(resource)
  end

  def edit
    resource
  end

  def new
    @objetivo = Objetivo.new
  end

  def create
    @Objetivo = Objetivo.new(objetivo_params)
    if @objetivo.save
      redirect_to root_path, notice: t(:objetivo_created)
    else
      render action: "new"
    end
  end

  def update
    if resource.update_attributes(objetivo_params)
      redirect_to objetivo_path(resource), notice: t(:objetivo_updated)
    else
      render action: "edit"
    end
  end

  private

  def entry_type
    request.fullpath == mileage_entry_path ? "mileages" : "hours"
  end

  def resource
    @objetivo ||= Objetivo.find_by_slug(params[:id])
  end

  def objetivo_params
    params.require(:objetivo).
      permit(:codigo, :nombre, :direccion, :billable, :telefono, :email)
  end
end
