class CreateCargahoras < ActiveRecord::Migration
  def change
    create_table :cargahoras do |t|
      t.references :objetivo, index: true, null: false
      t.references :legajo, index: true, null: false
      t.references :user, index: true, null: false
      t.integer :horas
      t.date :fecha

      t.timestamps null: false
    end
  end
end
