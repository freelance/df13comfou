class CreateLegajos < ActiveRecord::Migration
  def change
    create_table :legajos do |t|
      t.string :nro
      t.string :apellido
      t.string :nombre
      t.string :jerarquia
      t.string :cargo
      t.string :destinoactual
      t.string :uurr
      t.string :funcion
      t.string :documento
      t.string :titulo
      t.string :establecimiento

      t.timestamps null: false
    end
  end
end
