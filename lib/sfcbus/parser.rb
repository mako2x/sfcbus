#coding:utf-8
require 'date'

module SFCBus
  class Parser
    def self.parse(body)
      body =~ /callback\((.+)\);/
      json = JSON.parse($1)
      updated_at = parse_updated_at(json.pop)

      timetable = []
      json.each do |json2|
        json2.each_with_index do |buses, day_type|
          buses.each do |bus|
            timetable << SFCBus::Bus.new(
              :day_type  => parse_day_type(day_type),
              :from      => parse_location(bus['from']),
              :to        => parse_location(bus['to']),
              :hour      => bus['h'],
              :min       => bus['m'],
              :type      => parse_bus_type(bus['type']),
              :is_rotary => parse_is_rotary(bus['type'])
            )
          end
        end
      end
      {:timetable => timetable, :updated_at => updated_at}
    end

    def self.parse_updated_at(str)
      year, month, day = str.split('.').map(&:to_i)
      Date.new(year, month, day)
    end

    def self.parse_day_type(num)
      [
        SFCBus::DayTypes::Weekday,
        SFCBus::DayTypes::Saturday,
        SFCBus::DayTypes::Holiday
      ][num]
    end

    def self.parse_bus_type(str)
      char = str.sub('r', '')
      return SFCBus::Types::Normal if char == ''
      {
        't' => SFCBus::Types::Twinliner,
        's' => SFCBus::Types::Sasakubo,
        'n' => SFCBus::Types::Night
      }[char]
    end

    def self.parse_location(str)
      {
        'sfc'  => SFCBus::Locations::SFC,
        'sho'  => SFCBus::Locations::Shonandai,
        'tuji' => SFCBus::Locations::Tsujido
      }[str]
    end

    def self.parse_is_rotary(str)
      str.include?('r')
    end
  end
end
