class Comment < ApplicationRecord
    # Asociación (Cardinalidad) con los artículos
    belongs_to :article           # N a 1: Un comentario pertenece a un artículo
end
