class ProyectsController < ApplicationController
    http_basic_authenticate_with name: 'desafiovamoscontodo', password: 'XAHTJEAS23123%23'
    before_action :set_proyect, only: [:show, :edit, :update]
    
        def index
            @q = Proyect.ransack(params[:q])
            @proyects = @q.result(distinct: true).order(:name).page(params[:page]).per(15)
        end

        def new
            @proyect = Proyect.new
        end
    
        def show
        end

        def create
            @proyect = Proyect.new(proyect_params)
            if @proyect.save
            redirect_to root_path, notice: 'Se ha creado el proyecto'
            else
            redirect_to proyects_new_path, alert: 'No se pudo crear el proyecto'
            end
        end
        
        def edit
        end
  
        def update
        @proyect.update(
            name: params[:proyect][:name], 
            description: params[:proyect][:description], 
            state: params[:proyect][:state], 
            initial_date: params[:proyect][:initial_date], 
            finish_date: params[:proyect][:finish_date]
        )
        redirect_to proyects_index_path
        end
    
    private
        
        def set_proyect
            @proyect = Proyect.find(params[:id])
        end

        def proyect_params
            params.require(:proyect).permit(:name, :description, :state, :initial_date, :finish_date)
        end

end