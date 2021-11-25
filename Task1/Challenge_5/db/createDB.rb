require 'pg'

def createDB(db) 

  db.exec(
    "CREATE TYPE enum_materials_types AS ENUM (
      'Brochure',
      'Poster',
      'Print',
      'Flag',
      'Sticker'
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
    "CREATE TYPE enum_office_lobs AS ENUM (
      'Commercial',
      'Charity'
  );")
  
  db.exec(
      "CREATE TYPE enum_office_types AS ENUM (
        'Office',
        'ATM'
    );")
  
  db.exec(
      'CREATE TABLE IF NOT EXISTS "offices" (
      "id" SERIAL PRIMARY KEY,
      "office_name" varchar NOT NULL UNIQUE,
      "office_address" varchar NOT NULL,
      "office_city" varchar NOT NULL,
      "office_state" varchar NOT NULL,
      "office_phone" BIGINT NOT NULL UNIQUE,
      "office_lob" enum_office_lobs NOT NULL,
      "office_type" enum_office_types NOT NULL
    );')
  
  
  db.exec(
      'CREATE TABLE IF NOT EXISTS "zones" (
        "id" SERIAL PRIMARY KEY,
        "zone_name" varchar NOT NULL,
        "office_id" integer NOT NULL
      );
      ALTER TABLE "zones" ADD FOREIGN KEY ("office_id") REFERENCES "offices" ("id");'
  )
  
  
  db.exec(
    'CREATE TABLE IF NOT EXISTS "rooms" (
    "id" SERIAL PRIMARY KEY,
    "room_name" varchar NOT NULL,
    "room_area" integer NOT NULL,
    "room_max_people" integer NOT NULL,
    "zone_id" integer NOT NULL
    );
    ALTER TABLE "rooms" ADD FOREIGN KEY ("zone_id") REFERENCES "zones" ("id");'
  )
  
  db.exec(
    'CREATE TABLE IF NOT EXISTS "fixtures" (
      "id" SERIAL PRIMARY KEY,
      "fixture_type" enum_fixture_types NOT NULL,
      "fixture_name" varchar NOT NULL,
      "room_id" integer NOT NULL
    );
    ALTER TABLE "fixtures" ADD FOREIGN KEY ("room_id") REFERENCES "rooms" ("id");'
  )
  
  
  db.exec(
    'CREATE TABLE IF NOT EXISTS "marketing_materials" (
      "id" SERIAL PRIMARY KEY NOT NULL,
      "marketing_materials_name" varchar NOT NULL,
      "marketing_materials_type" enum_materials_types NOT NULL,
      "marketing_materials_cost" integer NOT NULL,
      "fixture_id" integer NOT NULL
    );
    ALTER TABLE "marketing_materials" ADD FOREIGN KEY ("fixture_id") REFERENCES "fixtures" ("id");'
  )
end
