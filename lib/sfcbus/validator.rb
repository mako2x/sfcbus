#coding:utf-8
require 'open-uri'
require 'net/http'
require 'json'

module SFCBus
  class Validator
    def self.validate(opts)
      _validate('Location', opts[:from])
      _validate('Location', opts[:to])
      _validate('Type', opts[:type])
      _validate('DayType', opts[:day_type])
    end

    private
    def self._validate(prop, val)
      return if val.nil?
      list = SFCBus.module_eval("#{prop}s")::List
      unless list.include?(val)
        err_msg = "Unknown #{prop.downcase} '#{val.to_s}'. Valid #{prop.downcase}s: #{list.map(&:to_s).join(', ')}"
        raise ArgumentError, err_msg
      end
    end
  end
end
