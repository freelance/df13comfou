class CreateCajas < ActiveRecord::Migration
  def change
    create_table :cajas do |t|
      t.date :fecha
      t.decimal :valor_inicial
      t.references :billete, index: true, foreign_key: true
      t.references :moneda, index: true, foreign_key: true
      t.string :turno
      t.references :user, index: true, foreign_key: true
      t.decimal :total
      t.boolean :estado

      t.timestamps null: false
    end
  end
end
