namespace :ffi do
  desc 'Generate ffi interface'
  task :generate do
    `swig -xml -o ioctl_wrap.xml  -I/usr/include swig/ioctl.i`
    `swig -xml -o input_wrap.xml  -I/usr/include swig/input.i`

    `ffi-gen ioctl_wrap.xml  lib/linux_input/generated/ioctl.rb`
    `ffi-gen input_wrap.xml  lib/linux_input/generated/input.rb`

    `sed -i 's/\\([0-9]\\)U/\\1/g' lib/linux_input/generated/ioctl.rb`
    `sed -i 's/_IO/IO/g' lib/linux_input/generated/ioctl.rb`
    `sed -i 's/ff_effect_u/FfEffectU/g' lib/linux_input/generated/input.rb`

    `rm -f ioctl_wrap.xml input_wrap.xml`
  end
end