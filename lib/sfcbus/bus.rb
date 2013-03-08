#coding:utf-8

module SFCBus
  class Bus
    attr_reader :day_type, :from, :to, :hour, :min, :type, :is_rotary

    def initialize(params)
      params.each { |k, v| instance_variable_set("@#{k}", v) }
    end

    def rotary?
      @is_rotary
    end

    def from_jp
      SFCBus::Locations::JP[@from]
    end

    def to_jp
      SFCBus::Locations::JP[@to]
    end

    def type_jp
      SFCBus::Types::JP[@type]
    end

    def day_type_jp
      SFCBus::DayTypes::JP[@day_type]
    end

    def inspect_time
      "#{@hour.to_s.rjust(2, '0')}:#{@min.to_s.rjust(2, '0')}"
    end
  end
end
