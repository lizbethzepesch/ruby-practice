require 'pg'

db = PG.connect(:dbname => 'task_the_first', :password => '', :port => 5432, :user => 'ykliuieva')

db.exec(
    'DROP TABLE IF EXISTS Offices, zones, rooms, fixtures, marketing_materials cascade;
     DROP TYPE IF EXISTS enum_materials_types, enum_Office_types, enum_fixture_types, enum_Office_lobs, enum_Office_types cascade;
    '
)