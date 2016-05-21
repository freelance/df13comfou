class CreateRecibos < ActiveRecord::Migration
  def change
    create_table :recibos do |t|
      t.string :codigo
      t.string :tipo
      t.decimal :monto
      t.date :fecha

      t.timestamps null: false
    end
  end
end
