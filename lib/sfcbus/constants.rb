#coding:utf-8

module SFCBus
  module Locations
    SFC       = :sfc
    Shonandai = :shonandai
    Tsujido   = :tsujido
    List      = [SFC, Shonandai, Tsujido]
    JP = {
      SFC       => 'SFC',
      Shonandai => '湘南台駅',
      Tsujido   => '辻堂駅',
    }
  end

  module Types
    Normal    = :normal
    Twinliner = :twinliner
    Sasakubo  = :sasakubo
    Night     = :night
    List      = [Normal, Twinliner, Sasakubo, Night]
    JP = {
      Normal    => '',
      Twinliner => 'ツインライナー',
      Sasakubo  => '笹久保経由',
      Night     => '深夜バス',
    }
  end

  module DayTypes
    Weekday  = :weekday
    Saturday = :saturday
    Holiday  = :holiday
    List     = [Weekday, Saturday, Holiday]
    JP = {
      Weekday  => '平日',
      Saturday => '土曜',
      Holiday  => '休日',
    }
  end

  module Rotary
    JP = 'ロータリー発'
  end

  TaxiPhoneNumber = '0120-87-2610'

end
