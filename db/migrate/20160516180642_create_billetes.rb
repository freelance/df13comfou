class CreateBilletes < ActiveRecord::Migration
  def change
    create_table :billetes do |t|
      t.integer :dospesos
      t.integer :cincupesos
      t.integer :diezpesos
      t.integer :veintepesos
      t.integer :cincuentapesos
      t.integer :cienpesos
      t.references :caja, index: true

      t.timestamps null: false
    end
  end
end
