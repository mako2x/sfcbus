#coding:utf-8
$:.unshift(File.dirname(__FILE__))

require 'sfcbus/version'
require 'sfcbus/constants'
require 'sfcbus/utils'
require 'sfcbus/validator'
require 'sfcbus/bus'
require 'sfcbus/parser'
require 'sfcbus/client'

module SFCBus
  def self.new
    SFCBus::Client.new
  end
end
