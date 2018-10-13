class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :article, foreign_key: true      # Crea una nueva columna en la tabla con el nombre del modelo proporcionado (:articles) al que le agregará el postfijo '_id'

      t.timestamps
    end
  end
end
