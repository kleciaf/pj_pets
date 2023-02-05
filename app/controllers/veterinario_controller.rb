class VeterinarioController < ApplicationController
    def index
        @veterinarios = Veterinario.all
      end
    
      def show
        @veterinario = Veterinario.find(params[:id])
      end
    
      def new
        @veterinario = Veterinario.new
      end
    
      def edit
        @veterinario = Veterinario.find(params[:id])
      end
    
      def create
        @veterinario = Veterinario.new(veterinario_params)
        if @veterinario.save
          redirect_to @veterinario, notice: 'Veterinário criado com sucesso.'
        else
          render :new
        end
      end
    
      private
        def veterinario_params
          params.require(:veterinario).permit(:nome, :cmrv, :especialidades)
        end
    end
    