class CreateMonedas < ActiveRecord::Migration
  def change
    create_table :monedas do |t|
      t.integer :cincocentavos
      t.integer :diezcentavos
      t.integer :venticincocentavos
      t.integer :cincuentacentavos
      t.integer :unpeso
      t.integer :dospesos
      t.references :caja, index: true


      t.timestamps null: false
    end
  end
end
