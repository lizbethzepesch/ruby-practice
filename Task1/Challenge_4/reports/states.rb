# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
# rubocop:disable Metrics/MethodLength

# Generates state reports
module ReportStates
  def report_states(db, template)
    offices = db.exec('SELECT * FROM offices ORDER BY office_state;')

    body = ''
    body += report_states_body(offices)

    report = template.gsub('{TITLE}', 'States Report').gsub('{BODY}', body)

    File.open('html/states.html', 'w') { |file| file.write(report) }
  end

  def report_states_body(offices)
    body = ''
    state = ''

    offices.each do |office|
      if state != office['office_state']
        body += '</tbody></table>' if state != ''

        state = office['office_state']

        body += "<h2 class='mt-5'>#{state}</h2><table class='table'><thead><tr><th>Office</th><th>Type</th><th>Address</th><th>LOB</th></tr></thead><tbody>"
      end

      office_str = '<tr>'
      office_str += "<td>#{office['office_name']}</td>"
      office_str += "<td>#{office['office_type']}</td>"
      office_str += "<td>#{office['office_address']}</td>"
      office_str += "<td>#{office['office_lob']}</td>"
      office_str += '</tr>'

      body += office_str
    end

    body += '</tbody></table>'
  end
end
