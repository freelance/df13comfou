# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160519023430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "billetes", force: :cascade do |t|
    t.integer  "dospesos"
    t.integer  "cincupesos"
    t.integer  "diezpesos"
    t.integer  "veintepesos"
    t.integer  "cincuentapesos"
    t.integer  "cienpesos"
    t.integer  "caja_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "billetes", ["caja_id"], name: "index_billetes_on_caja_id", using: :btree

  create_table "cajas", force: :cascade do |t|
    t.date     "fecha"
    t.decimal  "valor_inicial"
    t.integer  "billete_id"
    t.integer  "moneda_id"
    t.string   "turno"
    t.integer  "user_id"
    t.decimal  "total"
    t.boolean  "estado"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "cajas", ["billete_id"], name: "index_cajas_on_billete_id", using: :btree
  add_index "cajas", ["moneda_id"], name: "index_cajas_on_moneda_id", using: :btree
  add_index "cajas", ["user_id"], name: "index_cajas_on_user_id", using: :btree

  create_table "cargahoras", force: :cascade do |t|
    t.integer  "objetivo_id", null: false
    t.integer  "legajo_id",   null: false
    t.integer  "user_id",     null: false
    t.integer  "horas"
    t.date     "fecha"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cargahoras", ["legajo_id"], name: "index_cargahoras_on_legajo_id", using: :btree
  add_index "cargahoras", ["objetivo_id"], name: "index_cargahoras_on_objetivo_id", using: :btree
  add_index "cargahoras", ["user_id"], name: "index_cargahoras_on_user_id", using: :btree

  create_table "clientes", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.string   "telefono"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "horas", force: :cascade do |t|
    t.integer  "objetivo_id", null: false
    t.integer  "legajo_id",   null: false
    t.integer  "user_id",     null: false
    t.integer  "valor"
    t.date     "fecha"
    t.string   "descripcion"
    t.boolean  "cobrada"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "horas", ["legajo_id"], name: "index_horas_on_legajo_id", using: :btree
  add_index "horas", ["objetivo_id"], name: "index_horas_on_objetivo_id", using: :btree
  add_index "horas", ["user_id"], name: "index_horas_on_user_id", using: :btree

  create_table "legajos", force: :cascade do |t|
    t.string   "nro"
    t.string   "apellido"
    t.string   "nombre"
    t.string   "jerarquia"
    t.string   "cargo"
    t.string   "destinoactual"
    t.string   "uurr"
    t.string   "funcion"
    t.string   "documento"
    t.string   "titulo"
    t.string   "establecimiento"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "monedas", force: :cascade do |t|
    t.integer  "cincocentavos"
    t.integer  "diezcentavos"
    t.integer  "venticincocentavos"
    t.integer  "cincuentacentavos"
    t.integer  "unpeso"
    t.integer  "dospesos"
    t.integer  "caja_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "monedas", ["caja_id"], name: "index_monedas_on_caja_id", using: :btree

  create_table "objetivos", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "email"
    t.integer  "cliente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "objetivos", ["cliente_id"], name: "index_objetivos_on_cliente_id", using: :btree

  create_table "recibos", force: :cascade do |t|
    t.string   "codigo"
    t.string   "tipo"
    t.decimal  "monto"
    t.date     "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "cajas", "billetes"
  add_foreign_key "cajas", "monedas"
  add_foreign_key "cajas", "users"
end
