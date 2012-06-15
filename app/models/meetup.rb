
class Meetup
  include HTTParty

  base_uri 'api.meetup.com'

  def self.GetEvents
    return get('/events.json/', :query => {
        :topic => 'ruby',
        :zip => '94133',
        :key => '4e57237c653a2697e1842597a2c251a',
        })['results']
  end
  def self.AddEvents
    events = self.GetEvents
    events.each do |e|
      self.add_event_if_not_exists(e)
    end
  end

  def self.add_event_if_not_exists(event)
    id = event['id']
    if event['venue_address1'].blank?
      address = "San Francisco"
    else
      address = event['venue_address1']
    end

    exists = Event.find_by_e_id(id)
    if exists.blank?
      Event.create!(:title => event['name'],
      :e_id => event['id'],
      :description => event['description'],
      :time => event['time'],
      :url => event['event_url'],
      :address => address
      )
    end

  end


end