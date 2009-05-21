# postie

Postie is a Sinatra based rack middleware that can be dropped into any rack or rails application.
Postie provides Auspost (Australia Post) postcode information via a json interface.

Drop it into your application and happily use your favourite JavaScript library to work out what the postcode is for the suburb your user just typed in.

### Code quality
Its a bit rough; but it works. Patches are welcome.

## Sinatra or Rack applications

    require 'postie'
    use Postie::Application
  
## Rails applications

    require File.join(File.dirname(__FILE__), 'boot')

    Rails::Initializer.run do |config|
      config.gem 'postie', :lib => 'postie'

      config.middleware.use 'Postie::Application'
    end

## API

Drop in postie then navigate to `/postcode` for full API reference.

* `/postcode/states` Lists the states available
* `/postcode/state/:name` Lists the postcodes available for each state
* `/postcode/suburbs` Lists the suburbs available
* `/postcode/suburb/:name` Returns the postcode information for said suburb
    
### Data source

Postie data comes from Auspost, I haven't even read the terms of use, thats just how thug I am.
The database dump is dated 28/04/09

## Thanks

* Pat Allan, I stole his postie idea that was originally a Rails app, then a Merb app. I took one more progression and made it even smaller (Sinatra / Rack)
* Ben Askins, for the db:import / FasterCSV task

### Copyright

Copyright (c) 2009 Ben Schwarz. See LICENSE for details.
