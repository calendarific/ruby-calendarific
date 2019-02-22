# ruby-calendarific
Official Ruby library for Calendarific Global Holiday API

## Installation

```shell
gem install ruby-calendarific
```

## Usage

```ruby
require 'ruby-calendarific'

capi = Calendarific::V2.new('_YOUR_API_KEY_HERE_')

parameters = {
  'country' => 'US',
  'year'    => 2019
}

response = capi.holidays(parameters)
```
