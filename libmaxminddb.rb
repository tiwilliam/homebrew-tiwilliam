require 'formula'

class Libmaxminddb < Formula
  head 'https://github.com/maxmind/libmaxminddb.git', :revision => '8299f68bd83da08a3204a1d8bb964ae2f39fdd66'
  homepage 'https://github.com/maxmind'
  version '0.5.0'

  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build

  def install
    if Hardware.is_32_bit?
      ENV['ARCHFLAGS'] = "-arch #{Hardware::CPU.arch_32_bit}"
    else
      ENV['ARCHFLAGS'] = Hardware::CPU.universal_archs.as_arch_flags
    end

    system "./bootstrap"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "make", "check"
  end
end
