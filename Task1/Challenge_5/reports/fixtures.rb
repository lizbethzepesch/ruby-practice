# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/CyclomaticComplexity

module ReportFixtures
  def report_fixtures(db, template)
    fixtures = db.exec('SELECT * FROM fixtures ORDER BY fixture_type, room_id;')

    rooms = []
    db.exec('SELECT * FROM rooms').each do |room|
      rooms << { id: room['id'], zone: room['zone_id'] }
    end

    zones = []
    db.exec('SELECT * FROM zones').each do |zone|
      zones << { id: zone['id'], office: zone['office_id'] }
    end

    offices = []
    db.exec('SELECT * FROM offices').each do |office|
      offices << { id: office['id'], name: office['office_name'], address: office['office_address'], lob: office['office_lob'], type: office['office_type'] }
    end

    body = ''
    body += report_fixtures_body(fixtures, rooms, zones, offices)

    report = template.gsub('{TITLE}', 'Fixture Type Count Report').gsub('{BODY}', body)

    File.open('html/fixtures.html', 'w') { |file| file.write(report) }
  end

  def report_fixtures_body(fixtures, rooms, zones, offices)
    fixtures_groups = {}

    fixtures.each do |fixture|
      type = fixture['fixture_type']

      fixtures_groups[type] = {} unless fixtures_groups.key?(type)

      zone_id = rooms.find { |room| room[:id] == fixture['room_id'].to_s } [:zone]
      office_id = zones.find { |zone| zone[:id] == zone_id.to_s } [:office]

      fixtures_groups[type][office_id] = [] unless fixtures_groups[type].key?(office_id)
      fixtures_groups[type][office_id] << fixture
    end

    body = "<table class='table'>"

    fixtures_groups.each do |group_name, fixtures_group|
      group_body = ''
      group_count = 0

      fixtures_group.each do |office_id, fixture|
        fixture_office = offices.find { |office| office[:id] == office_id }
        office_count = fixture.length

        fixture_str = '<tr>'
        fixture_str += "<td>#{fixture_office[:name]}</td>"
        fixture_str += "<td>#{fixture_office[:type]}</td>"
        fixture_str += "<td>#{fixture_office[:address]}</td>"
        fixture_str += "<td>#{fixture_office[:lob]}</td>"
        fixture_str += "<td>#{office_count}</td>"
        fixture_str += '</tr>'

        group_body += fixture_str
        group_count += office_count
      end

      body += "<tr style='border-bottom: 1px solid black'><th colspan='5'><div class='d-flex'><h2 class='mt-5 flex-fill'>#{group_name}</h2><h2 class='mt-5'>#{group_count}</h2></div></th></tr>"
      body += "<tr><td><strong>Office</strong></td><td><strong>Type</strong></td><td><strong>Address</strong></td><td><strong>LOB</strong></td><td><strong>Sub Total Count</strong></td></tr>#{group_body}"
    end

    body += '</table>'
  end
end
