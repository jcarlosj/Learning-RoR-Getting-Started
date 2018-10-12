class ArticlesController < ApplicationController
    def new
    end
    def create
        #render plain: params[ :article ] .inspect
         @article = Article .new( params .require( :article )        # Creamos una instancia de la entidad (en el Modelo) y le pasamos los parámetros
            .permit(                                        # Parametros fuertes (o permitidos)
                :title,
                :text
            ) )

         @article .save                                     # Guarda los datos de la instancia en la base de datos
         redirect_to @article                               # Redirecciona al método 'show'
    end
end
