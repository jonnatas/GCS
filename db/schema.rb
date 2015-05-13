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

ActiveRecord::Schema.define(version: 20150511144759) do

  create_table "distortions", force: true do |t|
    t.integer  "year"
    t.integer  "state_id"
    t.string   "local"
    t.string   "test_type"
    t.float    "distortion"
    t.integer  "grade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grades", force: true do |t|
    t.string   "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "idebs", force: true do |t|
    t.float    "score"
    t.integer  "state_id"
    t.integer  "year"
    t.string   "test_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parses", force: true do |t|
    t.float    "ID_SAEB"
    t.float    "ID_REGIAO"
    t.string   "SIGLA_UF"
    t.float    "ID_UF"
    t.float    "ID_SERIE"
    t.float    "ID_TIPO_REDE"
    t.float    "ID_LOCALIZACAO"
    t.float    "ID_CAPITAL"
    t.float    "NU_PARTICIPANTES"
    t.float    "MEDIA_LP"
    t.float    "MEDIA_MT"
    t.float    "ERRO_PADRAO_LP"
    t.float    "ERRO_PADRAO_MT"
    t.float    "A"
    t.float    "B"
    t.float    "C"
    t.float    "D"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: true do |t|
    t.integer  "year"
    t.integer  "state_id"
    t.string   "local"
    t.string   "test_type"
    t.float    "peformance"
    t.float    "disapproval"
    t.float    "evasion"
    t.integer  "grade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
