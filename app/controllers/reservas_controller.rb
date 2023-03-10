class ReservasController < ApplicationController
  before_action :set_reserva, only: %i[ show update destroy ]

  # GET /reservas
  def index
    @reservas = Reserva.all

    render json: @reservas
  end

  # GET /reservas/1
  def show
    render json: @reserva
  end
  
  #DELETE /reservas/join/videojuegos/:id
  def joinVideojuegos
    @reserva = Reserva.where(videojuego_id: params[:id])
    @reserva.destroy(@reserva.ids)
  end

  # POST /reservas
  def create
    @reserva = Reserva.new(reserva_params)

    if @reserva.save
      render json: @reserva, status: :created, location: @reserva
    else
      render json: @reserva.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservas/1
  def update
    if @reserva.update(reserva_params)
      render json: @reserva
    else
      render json: @reserva.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservas/1
  def destroy
    @reserva.destroy
  end

  #DELETE /reservas/all
  def destroyAll
    Reserva.destroy_all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserva
      @reserva = Reserva.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reserva_params
      params.require(:reserva).permit(:videojuego_id)
    end
end
