class CreateHoras < ActiveRecord::Migration
  def change
    create_table :horas do |t|
      t.references :objetivo, index: true, null: false
      t.references :legajo, index: true, null: false
      t.references :user, index: true, null: false
      t.integer :valor
      t.date :fecha
      t.string :descripcion
      t.boolean :cobrada

      t.timestamps null: false
    end
  end
end
