class TemperaturesController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_temperature, only: %i[ show edit update destroy ]

  def index
    @temperatures = Temperature.order(created_at: :desc)
  end

  def show
  end

  def new
    @temperature = Temperature.new
  end

  def edit
  end

  def create
    @temperature = Temperature.new(temperature_params)

    respond_to do |format|
      if @temperature.save
        format.html { redirect_to @temperature, notice: "Temperature was successfully created." }
        format.json { render :show, status: :created, location: @temperature }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @temperature.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @temperature.update(temperature_params)
        format.html { redirect_to @temperature, notice: "Temperature was successfully updated." }
        format.json { render :show, status: :ok, location: @temperature }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @temperature.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @temperature.destroy!

    respond_to do |format|
      format.html { redirect_to temperatures_path, status: :see_other, notice: "Temperature was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_temperature
      @temperature = Temperature.find(params.expect(:id))
    end

    def temperature_params
      params.expect(temperature: [ :value ])
    end
end
