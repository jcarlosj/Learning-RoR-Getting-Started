class ArticlesController < ApplicationController
    def index
        @articles = Article .all
    end
    def show
        @article = Article .find( params[ :id ] )
    end
    def new
        @article = Article .new                             # Crea una instancia de la entidad vacía (nueva)
    end
    def edit
        @article = Article .find( params[ :id ] )
    end
    def create
        #render plain: params[ :article ] .inspect
         @article = Article .new( article_params )          # Creamos una instancia de la entidad (en el Modelo) y le pasamos los parámetros

         if @article .save                                  # Valida y Guarda los datos de la instancia en la base de datos si los datos pasados son validados correctamente por la entidad 'Article'
             redirect_to @article                           # Redirecciona al método 'show'
         else
             render 'new'                                   # Renderizará la vista con la ruta (o recurso) 'new' - Volverá al formulario
         end
    end
    def update
        @article = Article .find( params[ :id ] )

        if @article .update( article_params )               # Valida y Guarda los datos de la instancia en la base de datos si los datos pasados son validados correctamente por la entidad 'Article'
            redirect_to @article                            # Redirecciona al método 'show'
        else
            render 'edit'                                   # Renderizará la vista con la ruta (o recurso) 'edit' - Volverá al formulario de edición
        end
    end

    private
    def article_params
        params
           .require( :article )                            # Nombre del recurso requerido que posee los parámetros
           .permit(                                        # Parametros fuertes (o permitidos)
               :title,
               :text
           )
    end
end
