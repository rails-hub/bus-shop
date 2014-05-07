class Pageviews
  extend Garb::Resource
  metrics :exits, :pageviews
  dimensions :page_path
end

class Exits
  extend Garb::Model
  metrics :exits, :pageviews
  dimensions :page_path
end