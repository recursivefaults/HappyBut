class Happy < ActiveRecord::Base
  attr_accessible :happy, :but
  def self.create(happy_hash = {})
    #Validate?
    id = REDIS.get :next_id
    REDIS.multi do
      happy_hash[:time] = Time.now.utc.to_s
      REDIS["#{id}:happy"] = happy_hash[:happy]
      REDIS["#{id}:but"]   = happy_hash[:but]
      REDIS["#{id}:time"]  = happy_hash[:time]
    end
    REDIS.incr :next_id
    happy_hash
  end
  def self.list(start_id = REDIS.get(:next_id), stop_count = 100)
    items = []
    start_id = start_id.to_i
    logger.debug {"Start id: #{start_id}\tStop ID: #{stop_count}"}
    start_id.downto(start_id - stop_count).each do |id|
      happy_hash = {}
      happy_hash[:happy]      = REDIS.get "#{id}:happy"
      happy_hash[:but]        = REDIS.get "#{id}:but"
      happy_hash[:time]       = REDIS.get "#{id}:time"
      items.push happy_hash unless happy_hash[:happy].nil?
    end
    items
  end
end
