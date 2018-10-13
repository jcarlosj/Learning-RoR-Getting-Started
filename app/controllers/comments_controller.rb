class CommentsController < ApplicationController
    def create
        @article = Article .find( params[ :article_id ] )           # Obtiene el articulo con el ID especificado
        @comment = @article .comments .create( comment_params )     # Crea y guarda el comentario en la base de datos a asociando este con el ID del artículo obtenido

        redirect_to article_path( @article )    # Redirecciona al método 'show'
    end

    private
    def comment_params
        params
            .require( :comment )                # Nombre del recurso requerido que posee los parámetros
            .permit(                            # Parametros fuertes (o permitidos)
                :commenter,
                :body
            )
    end
end
