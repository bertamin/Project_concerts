class ConcertsController < ApplicationController
	def index
		@concerts = Concert.all
	end
	def new
		@concert = Concert.new
	end
	def show
		@concert = Concert.find(params[:id])
	end
	def edit
		@concert = Concert.find(params[:id])
	end
	def create
		@concert = Concert.new(concert_params)
		@concert.save
		redirect_to concert_path(@concert)
	end
	def update
		@concert = Concert.find(params[:id])
		@concert.update(concert_params)
		redirect_to concert_path(@concert)
	end
	def destroy
		@concert = Concert.find(params[:id])
		@concert.destroy
		redirect_to concerts_path
	end
	# El metodo like no está bien, hay que investigar la manera de hacerlo. Es decir, está realizado
	# hasta el párrafo que empieza: "Now go to your concert controller... " en la plataforma.
	def like
		@concert.likes += 1
	end
	private
		def concert_params
			params.require(:concert).permit(:band_name, :venue, :city, :date, :price, :description)
		end
end
