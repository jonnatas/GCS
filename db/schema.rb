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

ActiveRecord::Schema.define(version: 20150507202428) do

  create_table "distortions", force: true do |t|
    t.string   "ano"
    t.string   "regiao"
    t.string   "uf"
    t.string   "local"
    t.string   "Rede"
    t.float    "di_1"
    t.float    "di_2"
    t.float    "di_3"
    t.float    "di_4"
    t.float    "di_5"
    t.float    "di_6"
    t.float    "di_7"
    t.float    "di_8"
    t.float    "di_9"
    t.float    "di_1_5"
    t.float    "di_6_9"
    t.float    "total_fun"
    t.float    "di_1_m"
    t.float    "di_2_m"
    t.float    "di_3_m"
    t.float    "di_4_m"
    t.float    "total_med"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "idebs", force: true do |t|
    t.float    "ideb"
    t.string   "uf"
    t.float    "ano"
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parseidebs", force: true do |t|
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

  create_table "prova_brasils", force: true do |t|
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
    t.float    "ano"
    t.string   "abrangencia"
    t.string   "local"
    t.string   "Rede"
    t.float    "ap_1"
    t.float    "ap_2"
    t.float    "ap_3"
    t.float    "ap_4"
    t.float    "ap_5"
    t.float    "ap_6"
    t.float    "ap_7"
    t.float    "ap_8"
    t.float    "ap_9"
    t.float    "ap_1_5"
    t.float    "ap_6_9"
    t.float    "total_ap_fun"
    t.float    "ap_1_m"
    t.float    "ap_2_m"
    t.float    "ap_3_m"
    t.float    "ap_4_m"
    t.float    "ap_total_m_n_s"
    t.float    "total_ap_m"
    t.float    "rp_1"
    t.float    "rp_2"
    t.float    "rp_3"
    t.float    "rp_4"
    t.float    "rp_5"
    t.float    "rp_6"
    t.float    "rp_7"
    t.float    "rp_8"
    t.float    "rp_9"
    t.float    "rp_1_5"
    t.float    "rp_6_9"
    t.float    "rp_total_fun"
    t.float    "rp_1_m"
    t.float    "rp_2_m"
    t.float    "rp_3_m"
    t.float    "rp_4_m"
    t.float    "total_rp_m_n_s"
    t.float    "total_rp_m"
    t.float    "ab_1"
    t.float    "ab_2"
    t.float    "ab_3"
    t.float    "ab_4"
    t.float    "ab_5"
    t.float    "ab_6"
    t.float    "ab_7"
    t.float    "ab_8"
    t.float    "ab_9"
    t.float    "ab_1_5"
    t.float    "ab_6_9"
    t.float    "total_ab_fun"
    t.float    "ab_1_m"
    t.float    "ab_2_m"
    t.float    "ab_3_m"
    t.float    "ab_4_m"
    t.float    "total_ab_n_s"
    t.float    "total_ab_m"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
