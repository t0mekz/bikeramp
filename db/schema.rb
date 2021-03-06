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

ActiveRecord::Schema.define(version: 2018_11_15_203523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "trips", force: :cascade do |t|
    t.string "start_address", null: false
    t.string "destination_address", null: false
    t.float "price", null: false
    t.date "date", null: false
    t.integer "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


  create_view "daily_statistics",  sql_definition: <<-SQL
      SELECT trips.date,
      sum(trips.distance) AS total_distance,
      avg(trips.distance) AS avg_ride,
      avg(trips.price) AS avg_price
     FROM trips
    WHERE (trips.distance IS NOT NULL)
    GROUP BY trips.date;
  SQL

  create_view "weekly_statistics", materialized: true,  sql_definition: <<-SQL
      SELECT (date_trunc('week'::text, (trips.date)::timestamp with time zone))::date AS week_start,
      ((date_trunc('week'::text, (trips.date)::timestamp with time zone) + '6 days'::interval))::date AS week_end,
      sum(trips.distance) AS total_distance,
      sum(trips.price) AS total_price
     FROM trips
    GROUP BY ((date_trunc('week'::text, (trips.date)::timestamp with time zone))::date), (((date_trunc('week'::text, (trips.date)::timestamp with time zone) + '6 days'::interval))::date);
  SQL

end
