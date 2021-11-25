def getOfficesInfo(file, db)
    file.each do |row|
        data = {
            name: row['Office'].gsub('\'', '\\\''),
            address: row['Office address'].gsub('\'', '\\\''),
            city: row['Office city'],
            state: row['Office State'],
            phone: row['Office phone'],
            lob: row['Office lob'],
            type: row['Office type']
        }
        db.exec(
            "INSERT INTO offices(office_name, office_address, office_city, office_state, office_phone, office_lob, office_type)
            VALUES('#{data[:name]}', '#{data[:address]}', '#{data[:city]}', '#{data[:state]}', '#{data[:phone]}', '#{data[:lob]}', '#{data[:type]}')
            ON CONFLICT(office_name)
            DO NOTHING"
          )
        
    end

end

def getZonesInfo(file, db)
    file.each do |row|
        data = { 
            zone_name: row['Zone'].gsub('\'', '\\\'')
        }
  
        office_name = row['Office'].gsub('\'', '\\\'')
        data[:office_id] = db.exec("SELECT (id) from offices WHERE office_name='#{office_name}'").getvalue(0, 0)
        is_unique = db.exec("SELECT COUNT(*) from zones WHERE office_id=#{data[:office_id]} AND zone_name='#{data[:zone_name]}'").getvalue(0, 0)

        if(Integer(is_unique) == 0)
            db.exec("INSERT INTO zones(zone_name, office_id)
            VALUES('#{data[:zone_name]}', '#{data[:office_id]}')")
        end
      end
end

def getRoomsInfo(file, db)
    file.each do |row|
        data = { 
            room_name: row['Room'].gsub('\'', '\\\''),
            room_area: row['Room area'],
            room_max_people: row['Room max people']
        }
  
        zone_name = row['Zone'].gsub('\'', '\\\'')
        office_name = row['Office'].gsub('\'', '\\\'')

        office_id = db.exec("SELECT (id) from offices WHERE office_name='#{office_name}'").getvalue(0, 0)
        data[:zone_id] = db.exec("SELECT (id) from zones WHERE office_id='#{office_id}' and zone_name='#{zone_name}'").getvalue(0, 0)

        is_unique = db.exec("SELECT COUNT(*) from rooms WHERE zone_id=#{data[:zone_id]} AND room_name='#{data[:room_name]}'").getvalue(0, 0)

        if(Integer(is_unique) == 0)
            db.exec("INSERT INTO rooms(room_name, room_area, room_max_people, zone_id)
            VALUES('#{data[:room_name]}', '#{data[:room_area]}', '#{data[:room_max_people]}', '#{data[:zone_id]}')")
        end
      end
end

def getFixturesInfo(file, db)
    file.each do |row|
        data = { 
            fixture_name: row['Fixture'].gsub('\'', '\\\''),
            fixture_type: row['Fixture Type'],
        }
  
        zone_name = row['Zone'].gsub('\'', '\\\'')
        office_name = row['Office'].gsub('\'', '\\\'')
        room_name = row['Room'].gsub('\'', '\\\'')

        office_id = db.exec("SELECT (id) from offices WHERE office_name='#{office_name}'").getvalue(0, 0)
        zone_id = db.exec("SELECT (id) from zones WHERE office_id='#{office_id}' and zone_name='#{zone_name}'").getvalue(0, 0)
        data[:room_id] = db.exec("SELECT (id) from rooms WHERE zone_id='#{zone_id}' and room_name='#{room_name}'").getvalue(0, 0)

        is_unique = db.exec("SELECT COUNT(*) from fixtures WHERE room_id=#{data[:room_id]} AND fixture_name='#{data[:fixture_name]}'").getvalue(0, 0)

        if(Integer(is_unique) == 0)
            db.exec("INSERT INTO fixtures(fixture_name, fixture_type, room_id)
            VALUES('#{data[:fixture_name]}', '#{data[:fixture_type]}', '#{data[:room_id]}')")
        end
      end
end

def getMarketingMaterialsInfo(file, db)
    file.each do |row|
        data = { 
            marketing_materials_name: row['Marketing material'].gsub('\'', '\\\''),
            marketing_materials_type: row['Marketing material type'],
            marketing_materials_cost: row['Marketing material cost']
        }
  
        zone_name = row['Zone'].gsub('\'', '\\\'')
        office_name = row['Office'].gsub('\'', '\\\'')
        room_name = row['Room'].gsub('\'', '\\\'')
        fixture_name = row['Fixture'].gsub('\'', '\\\'')

        office_id = db.exec("SELECT (id) from offices WHERE office_name='#{office_name}'").getvalue(0, 0)
        zone_id = db.exec("SELECT (id) from zones WHERE office_id='#{office_id}' and zone_name='#{zone_name}'").getvalue(0, 0)
        room_id = db.exec("SELECT (id) from rooms WHERE zone_id='#{zone_id}' and room_name='#{room_name}'").getvalue(0, 0)
        data[:fixture_id] = db.exec("SELECT (id) from fixtures WHERE room_id='#{room_id}' and fixture_name='#{fixture_name}'").getvalue(0, 0)
        is_unique = db.exec("SELECT COUNT(*) from marketing_materials WHERE fixture_id=#{data[:fixture_id]} AND marketing_materials_name='#{data[:marketing_materials_name]}'").getvalue(0, 0)

        if(Integer(is_unique) == 0)
            db.exec("INSERT INTO marketing_materials(marketing_materials_name, marketing_materials_type, marketing_materials_cost, fixture_id)
            VALUES('#{data[:marketing_materials_name]}', '#{data[:marketing_materials_type]}', '#{data[:marketing_materials_cost]}', '#{data[:fixture_id]}')")
        end
      end
end
