class Article < ApplicationRecord
    # Valida el campo de título del artículo
    validates :title,
        presence: true,
        length: { minimum: 5 }
end
