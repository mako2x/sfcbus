#coding:utf-8
require 'open-uri'
require 'net/http'
require 'json'

module SFCBus
  class Client
    def fetch
      http = Net::HTTP.new('hack.sfc.keioac.jp')
      res  = http.get('/sfcbusapi/index.php')
      res.value
      parsed = SFCBus::Parser.parse(res.body)
      @updated_at = parsed[:updated_at]
      @timetable  = parsed[:timetable]
    end

    def timetable
      fetch if @timetable.nil?
      @timetable
    end

    def updated_at
      fetch if @updated_at.nil?
      @updated_at
    end

    def select(opts = {})
      SFCBus::Validator.validate(opts)

      list = timetable
      list.select! { |bus| bus.from     == opts[:from]      } unless opts[:from].nil? 
      list.select! { |bus| bus.to       == opts[:to]        } unless opts[:to].nil? 
      list.select! { |bus| bus.type     == opts[:type]      } unless opts[:type].nil? 
      list.select! { |bus| bus.day_type == opts[:day_type]  } unless opts[:day_type].nil? 
      list.select! { |bus| bus.rotary?  == opts[:is_rotary] } unless opts[:is_rotary].nil? 
      list
    end

    def next_list(opts = {})
      if opts[:from].nil? and opts[:to].nil?
        route = [SFCBus::Locations::SFC, SFCBus::Locations::Shonandai]
        opts[:from], opts[:to] = SFCBus::Utils.at_sfc? ? route : route.reverse
      end
      opts[:day_type] ||= SFCBus::Utils.today_day_type
      opts[:limit]    ||= 5

      now = Time.now
      select(opts).select { |b|
        (now.hour < b.hour) or (now.hour == b.hour and now.min < b.min)
      }.take(opts[:limit])
    end
  end
end
