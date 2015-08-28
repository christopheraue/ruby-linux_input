# LinuxInput

FFI structs and constants for linux's input subsystem found in linux/input.h

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'linux_input'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install linux_input

## Usage

```ruby
require 'linux_input'
```

All constants and structures are accessible through the LinuxInput module.

snake_case C structure names are transformed into CamelCase Ruby constant names:

```ruby
LinuxInput::InputEvent   # input_event struct
LinuxInput::FfEffect     # ff_effect struct
# and so on ...
```

Mapping a received event to the input_event struct:

```ruby
file = File.open('/dev/input/event0')

loop do
    raw_event = file.read LinuxInput::InputEvent.size
    raw_event_ptr = FFI::MemoryPointer.from_string(raw_event)
    event = LinuxInput::InputEvent.new(raw_event_ptr)
    puts Time.at(event[:time][:tv_sec])
    puts event[:type]
    puts event[:code]
    puts event[:value]
end
```

Constant names are left untouched:

```ruby
LinuxInput::EV_KEY     # => 0x01 (key event bit)
LinuxInput::KEY_A      # => 30 (key code of the a key)
# and so on ...
``

Ioctl constants and macros:

```ruby
LinuxInput::EVIOCGID
LinuxInput::EVIOCGNAME(len)
# and so on ...
```

## (Re-)Compiling the interface on a linux machine

Reads your local linux/input.h

```
$ rake ffi:generate
```
