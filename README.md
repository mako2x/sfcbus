SFCBus [![Build Status](https://travis-ci.org/mako2x/sfcbus.png?branch=master)](https://travis-ci.org/mako2x/sfcbus)
===
Ruby gem that provides bus information at Keio Univ SFC.


Installation
---
    $ gem install sfcbus


Usage
---
#### Command Line

    $ sfcbus
    平日
    湘南台駅 -> SFC
    ----------
    16:33
    16:39 ツインライナー
    16:45 笹久保経由
    16:52 ツインライナー
    17:00


#### Ruby
```ruby
require 'sfcbus'

sfcbus    = SFCBus.new
timetable = sfcbus.select(
  :from     => :sfc,
  :to       => :shonandai,
  :day_type => :weekday
)

# Result
timetable.each do |bus|
  puts bus.hour
  puts bus.min
  puts bus.from    # => :sfc, :shonandai, :tsujido
  puts bus.to      # => :sfc, :shonandai, :tsujido
  puts bus.type    # => :normal, :twinliner, :sasakubo, :night
  puts bus.rotary?
end

# Timetable last updated
p sfcbus.updated_at

```

Test
---
    $ rake spec


Contributing
---

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
