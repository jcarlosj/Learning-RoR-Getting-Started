class Comment < ApplicationRecord
  belongs_to :article           # Configura la asociación de registro activo - 'Article'
end
