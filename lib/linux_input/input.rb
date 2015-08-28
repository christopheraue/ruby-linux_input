module LinuxInput
  class Timeval < FFI::Struct
    layout(
      :tv_sec, :__time_t,
      :tv_usec, :__suseconds_t
    )
  end

  class_eval File.read(File.join(File.dirname(__FILE__), 'generated/input.rb'))

  INPUT_IOCTL_BASE = ?E.ord

  EVIOCGVERSION    = Ioctl.IOR(INPUT_IOCTL_BASE, 0x01, :int)
  EVIOCGID         = Ioctl.IOR(INPUT_IOCTL_BASE, 0x02, InputId.by_value)
  EVIOCGREP        = Ioctl.IOR(INPUT_IOCTL_BASE, 0x03, :pointer)
  EVIOCSREP        = Ioctl.IOW(INPUT_IOCTL_BASE, 0x03, :pointer)
  EVIOCGKEYCODE    = Ioctl.IOR(INPUT_IOCTL_BASE, 0x04, :pointer)
  EVIOCGKEYCODE_V2 = Ioctl.IOR(INPUT_IOCTL_BASE, 0x04, InputKeymapEntry.by_value)
  EVIOCSKEYCODE    = Ioctl.IOW(INPUT_IOCTL_BASE, 0x04, :pointer)
  EVIOCSKEYCODE_V2 = Ioctl.IOW(INPUT_IOCTL_BASE, 0x04, InputKeymapEntry.by_value)

  class << self
    def EVIOCGNAME(len)    Ioctl.IOC(Ioctl::IOC_READ, INPUT_IOCTL_BASE, 0x06, len) end
    def EVIOCGPHYS(len)    Ioctl.IOC(Ioctl::IOC_READ, INPUT_IOCTL_BASE, 0x07, len) end
    def EVIOCGUNIQ(len)    Ioctl.IOC(Ioctl::IOC_READ, INPUT_IOCTL_BASE, 0x08, len) end
    def EVIOCGPROP(len)    Ioctl.IOC(Ioctl::IOC_READ, INPUT_IOCTL_BASE, 0x09, len) end
    def EVIOCGMTSLOTS(len) Ioctl.IOC(Ioctl::IOC_READ, INPUT_IOCTL_BASE, 0x0a, len) end
    def EVIOCGKEY(len)     Ioctl.IOC(Ioctl::IOC_READ, INPUT_IOCTL_BASE, 0x18, len) end
    def EVIOCGLED(len)     Ioctl.IOC(Ioctl::IOC_READ, INPUT_IOCTL_BASE, 0x19, len) end
    def EVIOCGSND(len)     Ioctl.IOC(Ioctl::IOC_READ, INPUT_IOCTL_BASE, 0x1a, len) end
    def EVIOCGSW(len)      Ioctl.IOC(Ioctl::IOC_READ, INPUT_IOCTL_BASE, 0x1b, len) end
    def EVIOCGBIT(ev, len) Ioctl.IOC(Ioctl::IOC_READ, INPUT_IOCTL_BASE, 0x20 + ev, len) end
    def EVIOCGABS(abs)     Ioctl.IOR(INPUT_IOCTL_BASE, 0x40 + abs, InputAbsinfo.by_value) end
    def EVIOCSABS(abs)     Ioctl.IOW(INPUT_IOCTL_BASE, 0xc0 + abs, InputAbsinfo.by_value) end
  end

  EVIOCSFF         = Ioctl.IOC(Ioctl::IOC_WRITE, INPUT_IOCTL_BASE, 0x80, FfEffect.size)
  EVIOCRMFF        = Ioctl.IOW(INPUT_IOCTL_BASE, 0x81, :int)
  EVIOCGEFFECTS    = Ioctl.IOR(INPUT_IOCTL_BASE, 0x84, :int)
  EVIOCGRAB        = Ioctl.IOW(INPUT_IOCTL_BASE, 0x90, :int)
  EVIOCREVOKE      = Ioctl.IOW(INPUT_IOCTL_BASE, 0x91, :int)
  EVIOCSCLOCKID    = Ioctl.IOW(INPUT_IOCTL_BASE, 0xa0, :int)
end