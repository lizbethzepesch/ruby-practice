require 'pg'

db = PG.connect(:dbname => 'task_the_first', :password => '', :port => 5432, :user => 'ykliuieva')

db.exec(
  "CREATE TYPE enum_materials_types AS ENUM (
    'Brochure',
    'Poster',
    'Print',
    'Flag'
);")

db.exec(
  "CREATE TYPE enum_fixture_types AS ENUM (
    'Standing desk',
    'Door',
    'Window',
    'Wall poster',
    'Table',
    'ATM Wall',
    'Flag'
);")

db.exec(
  "CREATE TYPE enum_Office_lobs AS ENUM (
    'Commercial',
    'Charity'
);")

db.exec(
    "CREATE TYPE enum_Office_types AS ENUM (
      'Office',
      'ATM'
);")

db.exec(
    'CREATE TABLE IF NOT EXISTS "Offices" (
    "id" SERIAL PRIMARY KEY,
    "Office_name" varchar,
    "Office_address" varchar,
    "Office_city" varchar,
    "Office_state" varchar,
    "Office_phone" BIGINT,
    "Office_lob" enum_Office_lobs,
    "Office_type" enum_Office_types
);')

  
db.exec(
    'CREATE TABLE IF NOT EXISTS "rooms" (
    "id" SERIAL PRIMARY KEY,
    "Room_name" varchar,
    "Room_area" integer,
    "Room_max_people" integer,
    "zone_id" integer NOT NULL
    );
    ALTER TABLE "rooms" ADD FOREIGN KEY ("zone_id") REFERENCES "zones" ("id");'
)

db.exec(
    'CREATE TABLE IF NOT EXISTS "zones" (
      "id" SERIAL PRIMARY KEY,
      "zone_name" varchar,
      "Office_id" integer NOT NULL
    );
    ALTER TABLE "zones" ADD FOREIGN KEY ("Office_id") REFERENCES "Offices" ("id");'
)


db.exec(
  'CREATE TABLE IF NOT EXISTS "fixtures" (
    "id" SERIAL PRIMARY KEY,
    "fixture_type" enum_fixture_types,
    "fixture_name" varchar,
    "room_id" integer NOT NULL
  );
  ALTER TABLE "fixtures" ADD FOREIGN KEY ("room_id") REFERENCES "rooms" ("id");'
)


db.exec(
  'CREATE TABLE IF NOT EXISTS "marketing_materials" (
    "id" SERIAL PRIMARY KEY,
    "marketing_materials_name" varchar,
    "marketing_materials_type" enum_materials_types,
    "marketing_materials_cost" integer,
    "fixture_id" integer NOT NULL
  );
  ALTER TABLE "marketing_materials" ADD FOREIGN KEY ("fixture_id") REFERENCES "fixtures" ("id");'
)