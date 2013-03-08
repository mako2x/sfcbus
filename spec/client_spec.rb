#coding:utf-8
require File.dirname(__FILE__) + '/spec_helper.rb'

describe SFCBus::Client do
  before(:all) do
    @sfcbus = SFCBus.new
    open(File.dirname(__FILE__) + '/api.jsonp') do |f|
      timetable = SFCBus::Parser.parse(f.read)[:timetable]
      @sfcbus.stub!(:timetable).and_return(timetable)
    end
  end


  describe '#select' do
    it 'can select bus list from timetable' do
      bus = @sfcbus.select(
        :day_type  => :saturday,
        :from      => :sfc,
        :to        => :tsujido,
        :is_rotary => true
      ).first
      bus.day_type.should be :saturday
      bus.from.should be :sfc
      bus.to.should be :tsujido
      bus.rotary?.should be_true
    end
  end


  describe '#next_list' do
    before do
      SFCBus::Utils.stub!(:today_day_type).and_return(:weekday)
      SFCBus::Utils.stub!(:at_sfc?).and_return(false)
      Time.stub!(:now).and_return(Time.new(2013, 1, 1, 17, 30))
      @list = @sfcbus.next_list
    end

    it 'can limit list' do
      @list.size.should be 5
    end

    it 'uses default route if option is not given' do
      @list.first.from.should be :shonandai
      @list.first.to.should be :sfc
    end

    it 'can return next bus list' do
      @list.first.hour.should be 17
      @list.first.min.should be 33
    end
  end
end
