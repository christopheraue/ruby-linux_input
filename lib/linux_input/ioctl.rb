module Ioctl
  class_eval File.read(File.join(File.dirname(__FILE__), 'generated/ioctl.rb'))

  class << self
    def IOC(dir, type, nr, size)
      (dir << IOC_DIRSHIFT) | (type << IOC_TYPESHIFT) | (nr << IOC_NRSHIFT) | (size << IOC_SIZESHIFT)
    end

    def IO(type, nr)             IOC(IOC_NONE,             type, nr, 0) end
    def IOR(type, nr, size)      IOC(IOC_READ,             type, nr, FFI.type_size(size)) end
    def IOW(type, nr, size)      IOC(IOC_WRITE,            type, nr, FFI.type_size(size)) end
    def IOWR(type, nr, size)     IOC(IOC_READ | IOC_WRITE, type, nr, FFI.type_size(size)) end
    def IOR_BAD(type, nr, size)  IOC(IOC_READ,             type, nr, FFI.type_size(size)) end
    def IOW_BAD(type, nr, size)  IOC(IOC_WRITE,            type, nr, FFI.type_size(size)) end
    def IOWR_BAD(type, nr, size) IOC(IOC_READ | IOC_WRITE, type, nr, FFI.type_size(size)) end

    def IOC_DIR(nr)  (nr >> IOC_DIRSHIFT)  & IOC_DIRMASK  end
    def IOC_TYPE(nr) (nr >> IOC_TYPESHIFT) & IOC_TYPEMASK end
    def IOC_NR(nr)   (nr >> IOC_NRSHIFT)   & IOC_NRMASK   end
    def IOC_SIZE(nr) (nr >> IOC_SIZESHIFT) & IOC_SIZEMASK end
  end
end

