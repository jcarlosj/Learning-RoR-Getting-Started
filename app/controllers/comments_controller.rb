class CommentsController < ApplicationController

    # Sistema de autenticación HTTP básica de Rails
    http_basic_authenticate_with name: "admin", password: "12345", only: :destroy   # Acciones (o métodos) solo para usuarios autenticados

    def create
        @article = Article .find( params[ :article_id ] )           # Obtiene el articulo con el ID especificado
        @comment = @article .comments .create( comment_params )     # Crea y guarda el comentario en la base de datos a asociando este con el ID del artículo obtenido

        redirect_to article_path( @article )    # Redirecciona al método 'show'
    end
    def destroy
        @article = Article .find( params[ :article_id ] )           # Obtiene el articulo con el ID especificado
        @comment = @article .comments .find( params[ :id ] )        # Obtiene el comentario con el ID especificado del artículo
        @comment .destroy                                           # Elimina el registro del comentario en la base de datos

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
