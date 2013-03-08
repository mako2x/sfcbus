#coding:utf-8
require File.dirname(__FILE__) + '/spec_helper.rb'

describe SFCBus::Parser do
  describe '.parse_day_type' do
    it 'can parse day type number' do
      SFCBus::Parser.parse_day_type(2).should be :holiday
    end
  end

  describe '.parse_location' do
    it 'can parse location string' do
      SFCBus::Parser.parse_location('tuji').should be :tsujido
    end
  end

  describe '.parse_bus_type' do
    it 'can parse bus type string' do
      SFCBus::Parser.parse_bus_type('rt').should be :twinliner
    end
  end

  describe '.parse_is_rotary' do
    it 'can parse rotary string' do
      SFCBus::Parser.parse_is_rotary('rt').should be_true 
    end
  end

  describe '.parse_updated_at' do
    it 'can parse updated_at' do
      SFCBus::Parser.parse_updated_at('2012.12.16').should eq Date.new(2012, 12, 16)
    end
  end

  describe '.parse' do
    before(:all) do
      open(File.dirname(__FILE__) + '/api.jsonp') do |f|
        @body = f.read
      end
    end

    it 'can parse timetable' do
      bus = SFCBus::Parser.parse(@body)[:timetable].first
      bus.day_type.should be :weekday
      bus.from.should be :shonandai
      bus.to.should be :sfc
      bus.hour.should be 7
      bus.min.should be 10
      bus.type.should be :normal
      bus.rotary?.should be_false
    end
  end
end
