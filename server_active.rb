# Takes an URL and checks if its working. 
# Sends an alert if the server is ON when it is suppossed to be OFF.

class ServerActive < Scout::Plugin
  
  # An embedded YAML doc describing the options this plugin takes
  OPTIONS= <<-EOS
    url:
      name: url
      notes: The url to check if active
    days:
      default: '6,0'
      name: days
      notes: days of week where the server should be turned off [0,1,2,3,4,5,6] (0-6, Sunday is zero).
  EOS

  def build_report
    ok_status_codes = %w(302 200)

    url = option('url')
    error("You must provide a valid url") and return if !url

    curl_output = `curl -i #{option(:url)}`
    active = ok_status_codes.any? { |status_code| curl_output.include?(status_code) }
    report(:active=>active)

    days = option(:days).split(',').map(&:to_i)
    alert("#{option(:url)} is active") if active && days.include?(Time.now.wday)
  end
end