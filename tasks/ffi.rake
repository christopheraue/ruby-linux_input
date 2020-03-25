namespace :ffi do
  desc 'Generate ffi interface'
  task :generate do
    `swig -xml -o ioctl_wrap.xml  -I/usr/include swig/ioctl.i`
    `swig -xml -o input_wrap.xml  -I/usr/include swig/input.i`

    `ffi-gen ioctl_wrap.xml ioctl.rb`
    `ffi-gen input_wrap.xml input.rb`

    `cat ioctl.rb | sed -e 's/\\([0-9]\\)U/\\1/g' | sed -e 's/_IO/IO/g' > lib/linux_input/generated/ioctl.rb`
    `cat input.rb | sed -e 's/ff_effect_u/FfEffectU/g' > lib/linux_input/generated/input.rb`

    `rm -f ioctl_wrap.xml input_wrap.xml ioctl.rb input.rb`
  end
end