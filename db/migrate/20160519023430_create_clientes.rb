class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :codigo
      t.string :nombre
      t.string :telefono
      t.string :email

      t.timestamps null: false
    end
  end
end
