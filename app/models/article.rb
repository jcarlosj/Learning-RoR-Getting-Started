class Article < ApplicationRecord
    # Asociación (Cardinalidad) con los comentarios
    has_many :comments              # 1 a N: Un artículo puede tener muchos comentarios
    # Valida el campo de título del artículo
    validates :title,
        presence: true,
        length: { minimum: 5 }
end
