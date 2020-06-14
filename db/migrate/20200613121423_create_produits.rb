class CreateProduits < ActiveRecord::Migration[5.2]
  def change
    create_table :produits do |t|
      t.string :name
      t.float :price
      t.references :panier, foreign_key: true

      t.timestamps
    end
  end
end
