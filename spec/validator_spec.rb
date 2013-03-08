#coding:utf-8
require File.dirname(__FILE__) + '/spec_helper.rb'

describe SFCBus::Validator do
  describe '.validate' do
    it 'can validate options' do
      opt = {
        :from => :sfc,
        :to   => :tujido
      }
      lambda{ SFCBus::Validator.validate(opt) }.should raise_error(ArgumentError)
    end
  end
end
