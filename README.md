Scout Plugin: Server Active
-------------------------------
There are some servers that should only work during certain days of the week, and the rest must be OFF. For instance: Monday to Friday ON, weekend OFF.

This plugin takes an URL and checks if its working during the OFF days.
Sends an alert if the server is ON when it is suppossed to be OFF.

Installation
----------------
Follow Scout's installation instructions.

Parameters
----------------
url=http://yourserver.url
days='6,0' # Comma separated days of the week: 0-6 (Sunday is zero).

Example Scout Test
----------------
scout test server_active.rb url=http://yourserver.url days='6,0'