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

ActiveRecord::Schema.define(version: 2020_10_22_180138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bairros", force: :cascade do |t|
    t.bigint "city_id"
    t.integer "ref", null: false
    t.string "descricao"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_bairros_on_city_id"
  end

  create_table "ceps", force: :cascade do |t|
    t.bigint "bairro_id"
    t.integer "cep", null: false
    t.integer "ref", null: false
    t.string "tipo"
    t.string "logradouro"
    t.decimal "latitude"
    t.decimal "longitude"
    t.boolean "ativo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bairro_id"], name: "index_ceps_on_bairro_id"
  end

  create_table "cities", force: :cascade do |t|
    t.bigint "state_id"
    t.string "code", null: false
    t.integer "ref", null: false
    t.string "name", null: false
    t.string "ddd", null: false
    t.decimal "latitude"
    t.decimal "area"
    t.decimal "longitude"
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.string "acronym", null: false
    t.boolean "active", default: true, null: false
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empresa_seguimentos", force: :cascade do |t|
    t.string "descricao", null: false
    t.boolean "ativo", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empresa_usuarios", force: :cascade do |t|
    t.bigint "empresa_id"
    t.string "nome", null: false
    t.string "email", null: false
    t.boolean "email_validado", default: false, null: false
    t.string "senha", null: false
    t.string "telefone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["empresa_id"], name: "index_empresa_usuarios_on_empresa_id"
  end

  create_table "empresas", force: :cascade do |t|
    t.string "razao", null: false
    t.string "cnpj_cpf", null: false
    t.string "endereco", null: false
    t.string "cidade", null: false
    t.bigint "empresa_seguimento_id"
    t.text "sobre"
    t.string "cor_layout"
    t.string "fb_url"
    t.string "insta_url"
    t.string "pint_url"
    t.string "web_site"
    t.string "telefone"
    t.string "celular", null: false
    t.string "email", null: false
    t.string "loja", null: false
    t.string "logomarca"
    t.bigint "plano_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logomarca_file_name"
    t.string "logomarca_content_type"
    t.integer "logomarca_file_size"
    t.datetime "logomarca_updated_at"
    t.string "cor_fonte", default: "#000000", null: false
    t.index ["empresa_seguimento_id"], name: "index_empresas_on_empresa_seguimento_id"
    t.index ["plano_id"], name: "index_empresas_on_plano_id"
  end

  create_table "group_permission_flows", id: false, force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "permission_flow_id"
    t.index ["group_id"], name: "index_group_permission_flows_on_group_id"
    t.index ["permission_flow_id"], name: "index_group_permission_flows_on_permission_flow_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string "name", null: false
    t.string "class_icon", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "periodos", force: :cascade do |t|
    t.date "periodo", null: false
    t.date "dt_ini", null: false
    t.date "dt_fin", null: false
    t.bigint "plataforma_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plataforma_id"], name: "index_periodos_on_plataforma_id"
  end

  create_table "permission_actions", force: :cascade do |t|
    t.bigint "permission_controller_id"
    t.string "action_name", null: false
    t.boolean "action_controlled", default: true, null: false
    t.boolean "action_link", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_controller_id"], name: "index_permission_actions_on_permission_controller_id"
  end

  create_table "permission_controllers", force: :cascade do |t|
    t.string "controller_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permission_flow_actions", force: :cascade do |t|
    t.bigint "permission_flow_id"
    t.bigint "permission_action_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_action_id"], name: "index_permission_flow_actions_on_permission_action_id"
    t.index ["permission_flow_id"], name: "index_permission_flow_actions_on_permission_flow_id"
  end

  create_table "permission_flows", force: :cascade do |t|
    t.bigint "sub_menu_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_menu_id"], name: "index_permission_flows_on_sub_menu_id"
  end

  create_table "plano_pagamentos", force: :cascade do |t|
    t.bigint "empresa_id", null: false
    t.string "descricao", null: false
    t.boolean "disponivel", default: true, null: false
    t.boolean "troco_ativo", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_plano_pagamentos_on_empresa_id"
  end

  create_table "planos", force: :cascade do |t|
    t.bigint "plataforma_id"
    t.string "descricao", null: false
    t.decimal "valor", null: false
    t.integer "qtd_produto", null: false
    t.boolean "ativo", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plataforma_id"], name: "index_planos_on_plataforma_id"
  end

  create_table "plataforma_usuarios", force: :cascade do |t|
    t.string "nome", null: false
    t.string "senha", null: false
    t.bigint "plataforma_id"
    t.string "email", null: false
    t.boolean "ativo", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["plataforma_id"], name: "index_plataforma_usuarios_on_plataforma_id"
  end

  create_table "plataformas", force: :cascade do |t|
    t.string "descricao", null: false
    t.string "desenvolvedora", null: false
    t.string "cnpj", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "produto_categoria", force: :cascade do |t|
    t.bigint "empresa_id", null: false
    t.string "descricao", null: false
    t.boolean "disponivel", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_produto_categoria_on_empresa_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.bigint "empresa_id", null: false
    t.bigint "produto_categorium_id", null: false
    t.string "descricao", null: false
    t.text "especificacao"
    t.decimal "preco", default: "0.0", null: false
    t.boolean "promocao", default: false, null: false
    t.boolean "disponivel", default: true, null: false
    t.boolean "deletado", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "img_file_name"
    t.string "img_content_type"
    t.integer "img_file_size"
    t.datetime "img_updated_at"
    t.index ["empresa_id"], name: "index_produtos_on_empresa_id"
    t.index ["produto_categorium_id"], name: "index_produtos_on_produto_categorium_id"
  end

  create_table "states", force: :cascade do |t|
    t.bigint "country_id"
    t.string "code", null: false
    t.string "name", null: false
    t.string "acronym", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "sub_menus", force: :cascade do |t|
    t.bigint "menu_id"
    t.bigint "sub_menu_id"
    t.bigint "permission_action_id"
    t.string "name", null: false
    t.boolean "ajax", default: true, null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_sub_menus_on_menu_id"
    t.index ["permission_action_id"], name: "index_sub_menus_on_permission_action_id"
    t.index ["sub_menu_id"], name: "index_sub_menus_on_sub_menu_id"
  end

  add_foreign_key "bairros", "cities"
  add_foreign_key "ceps", "bairros"
  add_foreign_key "cities", "states"
  add_foreign_key "empresa_usuarios", "empresas"
  add_foreign_key "empresas", "empresa_seguimentos"
  add_foreign_key "empresas", "planos"
  add_foreign_key "group_permission_flows", "groups"
  add_foreign_key "group_permission_flows", "permission_flows"
  add_foreign_key "periodos", "plataformas"
  add_foreign_key "permission_actions", "permission_controllers"
  add_foreign_key "permission_flow_actions", "permission_actions"
  add_foreign_key "permission_flow_actions", "permission_flows"
  add_foreign_key "permission_flows", "sub_menus"
  add_foreign_key "plano_pagamentos", "empresas"
  add_foreign_key "planos", "plataformas"
  add_foreign_key "plataforma_usuarios", "plataformas"
  add_foreign_key "produto_categoria", "empresas"
  add_foreign_key "produtos", "empresas"
  add_foreign_key "produtos", "produto_categoria"
  add_foreign_key "states", "countries"
  add_foreign_key "sub_menus", "menus"
  add_foreign_key "sub_menus", "permission_actions"
  add_foreign_key "sub_menus", "sub_menus"
end
