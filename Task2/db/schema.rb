# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_09_124515) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "coach_notifications", force: :cascade do |t|
    t.text "body"
    t.boolean "status"
    t.bigint "coach_id", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_coach_notifications_on_coach_id"
    t.index ["user_id"], name: "index_coach_notifications_on_user_id"
  end

  create_table "coaches", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "email"
    t.string "password_digest"
    t.integer "gender"
    t.text "about"
    t.text "experience"
    t.text "licenses"
    t.text "education"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "coaches_problems", id: false, force: :cascade do |t|
    t.bigint "coach_id"
    t.bigint "problem_id"
    t.index ["coach_id"], name: "index_coaches_problems_on_coach_id"
    t.index ["problem_id"], name: "index_coaches_problems_on_problem_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "coach_id"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_invitations_on_coach_id"
    t.index ["user_id"], name: "index_invitations_on_user_id"
  end

  create_table "problems", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "problems_techniques", id: false, force: :cascade do |t|
    t.bigint "technique_id"
    t.bigint "problem_id"
    t.index ["problem_id"], name: "index_problems_techniques_on_problem_id"
    t.index ["technique_id"], name: "index_problems_techniques_on_technique_id"
  end

  create_table "problems_users", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "problem_id"
    t.index ["problem_id"], name: "index_problems_users_on_problem_id"
    t.index ["user_id"], name: "index_problems_users_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "technique_id"
    t.integer "like"
    t.integer "dislike"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["technique_id"], name: "index_ratings_on_technique_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "coach_id"
    t.bigint "technique_id"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer "status"
    t.integer "step"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_recommendations_on_coach_id"
    t.index ["technique_id"], name: "index_recommendations_on_technique_id"
    t.index ["user_id"], name: "index_recommendations_on_user_id"
  end

  create_table "social_networks", force: :cascade do |t|
    t.text "name"
    t.bigint "coach_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_social_networks_on_coach_id"
  end

  create_table "steps", force: :cascade do |t|
    t.text "body"
    t.string "title"
    t.integer "number"
    t.bigint "techniques_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["techniques_id"], name: "index_steps_on_techniques_id"
  end

  create_table "techniques", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "age"
    t.integer "gender"
    t.integer "total_steps"
    t.string "duration"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_notifications", force: :cascade do |t|
    t.text "body"
    t.boolean "status"
    t.bigint "coach_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_user_notifications_on_coach_id"
    t.index ["user_id"], name: "index_user_notifications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "email"
    t.integer "gender"
    t.text "about"
    t.string "password_digest"
    t.string "uid"
    t.string "provider"
    t.bigint "coach_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_users_on_coach_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "coach_notifications", "coaches"
  add_foreign_key "coach_notifications", "users"
  add_foreign_key "social_networks", "coaches"
  add_foreign_key "steps", "techniques", column: "techniques_id"
  add_foreign_key "user_notifications", "coaches"
  add_foreign_key "user_notifications", "users"
  add_foreign_key "users", "coaches"
end
