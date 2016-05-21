class CreateObjetivos < ActiveRecord::Migration
  def change
    create_table :objetivos do |t|
      t.string :codigo
      t.string :nombre
      t.string :direccion
      t.string :telefono
      t.string :email
      t.references :cliente, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
