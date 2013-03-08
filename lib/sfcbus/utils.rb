#coding:utf-8
require 'date'
require 'holidays'
require 'socket'

module SFCBus::Utils
  def self.today_day_type
    today = Date.today
    if today.holiday?(:jp)
      SFCBus::DayTypes::Holiday
    elsif today.sunday?
      SFCBus::DayTypes::Holiday
    elsif today.saturday?
      SFCBus::DayTypes::Saturday
    else
      SFCBus::DayTypes::Weekday
    end
  end

  def self.at_sfc?
    ip_address = Socket.getaddrinfo(Socket.gethostname, 'http')[0][2]
    !!(ip_address =~ /^(133\.27|203.178)/)
  end
end
