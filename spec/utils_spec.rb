#coding:utf-8
require File.dirname(__FILE__) + '/spec_helper.rb'
require 'date'

describe SFCBus::Utils do
  describe '.today_day_type' do
    it 'can return day type of today' do
      Date.stub!(:today).and_return(Date.new(2012, 7, 16))
      SFCBus::Utils.today_day_type.should be SFCBus::DayTypes::Holiday
    end
  end

  describe '.at_sfc?' do
    it 'can find location by ip address' do
      ip_address = '203.178.142.130'
      Socket.stub!(:getaddrinfo).and_return([['AF_INET', 80, ip_address]])
      SFCBus::Utils.at_sfc?.should be_true
    end
  end
end
