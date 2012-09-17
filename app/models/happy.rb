class Happy < ActiveRecord::Base
  attr_accessible :happy, :but
  def self.create(happy_hash = {})
    #Validate?
    id = REDIS.get :next_id
    REDIS.multi do
      REDIS["#{id}:happy"] = happy_hash[:happy]
      REDIS["#{id}:but"]   = happy_hash[:but]
      REDIS["#{id}:time"]  = Time.now.utc.to_s
    end
    REDIS.incr :next_id
  end
  def self.list(start_id = 0, stop_id = 100)
    items = []
    logger.debug {"Start id: #{start_id}\tStop ID: #{stop_id}"}
    (start_id..stop_id).each do |id|
      happy_hash = {}
      happy_hash[:happy]      = REDIS.get "#{id}:happy"
      happy_hash[:but]        = REDIS.get "#{id}:but"
      happy_hash[:time]       = REDIS.get "#{id}:time"
      items.push happy_hash unless happy_hash[:happy].nil?
    end
    items
  end
end
