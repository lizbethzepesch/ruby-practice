# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/LineLength

require 'quickchart'

module ReportCosts
  def report_costs(db, template)
    materials = db.exec('SELECT * FROM marketing_materials ORDER BY marketing_materials_type;')

    fixtures = []
    db.exec('SELECT * FROM fixtures').each do |fixture|
      fixtures << { id: fixture['id'], room: fixture['room_id'] }
    end

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
      offices << { id: office['id'], name: office['office_name'] }
    end

    body = ''
    body += report_costs_body(materials, fixtures, rooms, zones, offices)

    report = template.gsub('{TITLE}', 'Marketing Materials Costs Report').gsub('{BODY}', body)

    File.open('html/costs.html', 'w') { |file| file.write(report) }
  end

  def report_costs_body(materials, fixtures, rooms, zones, offices)
    material_groups = {}
    material_types = {}

    materials.each do |material|
      material_type = material['marketing_materials_type']
      material_cost = Integer(material['marketing_materials_cost'])

      fixture = fixtures.find { |fixture| fixture[:id] == material['fixture_id'] }
      room_id = rooms.find { |room| room[:id] == fixture[:room] }[:zone]
      zone_id = zones.find { |zone| zone[:id] == room_id.to_s } [:office]
      office_id = offices.find { |office| office[:id] == zone_id.to_s } [:id]

      #office_id = zones.find { |zone| zone[:id] == zone_id.to_s } [:office]
      # room_id = rooms.find { |room| room[:id] == fixture_id[:room] }[:office]
      # office_id = offices.find { |office| office[:id] == room_id }[:id]

      material_groups[office_id] = {} unless material_groups.key?(office_id)
      material_groups[office_id][material_type] = 0 unless material_groups[office_id].key?(material_type)
      material_groups[office_id][material_type] += material_cost

      material_types[material_type] = 0 unless material_types.key?(material_type)
      material_types[material_type] += material_cost
    end

    body = "<table class='table'>"

    material_groups.each do |office_id, material_group|
      group_body = ''
      group_cost = 0
      office_name = offices.find { |office| office[:id] == office_id }[:name]

      material_group.each do |type_name, type_cost|
        fixture_str = '<tr>'
        fixture_str += "<td>#{type_name}</td>"
        fixture_str += "<td>#{type_cost}</td>"
        fixture_str += '</tr>'

        group_body += fixture_str
        group_cost += type_cost
      end

      body += "<tr style='border-bottom: 1px solid black'><th colspan='2'><div class='d-flex'><h2 class='mt-5 flex-fill'>#{office_name}</h2><h2 class='mt-5'>#{group_cost}</h2></div></th></tr>"
      body += "<tr><td><strong>Material Type</strong></td><td><strong>Sub Total Costs</strong></td></tr>#{group_body}"
    end

    body += '</table>'

    qc = QuickChart.new(
      {
        type: 'doughnut',
        data: {
          labels: material_types.keys,
          datasets: [
            data: material_types.values
          ]
        }
      },
      width: 600,
      height: 300
    )

    body += "<h1 class='mt-5 text-center'>Marketing Material Costs By Type</h1><p class='text-center'><img src='#{qc.get_url}' /></p>"
  end
end
