#coding:utf-8
require File.dirname(__FILE__) + '/spec_helper.rb'

describe SFCBus::Bus do
  before(:all) do
    @bus = SFCBus::Bus.new(
      :from     => :sfc,
      :to       => :tsujido,
      :day_type => :saturday,
      :hour     => 7,
      :min      => 30
    )
  end

  describe '#inspect_time' do
    it 'returns time string' do
      @bus.inspect_time.should eq '07:30'
    end
  end

  describe '#to_jp' do
    it 'returns station name in japanese' do
      @bus.to_jp.should eq '辻堂駅'
    end
  end

  describe '#day_type_jp' do
    it 'returns day type in japanese' do
      @bus.day_type_jp.should eq '土曜'
    end
  end
end
