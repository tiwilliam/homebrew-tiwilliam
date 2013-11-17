require 'formula'

class Libmaxminddb < Formula
  homepage ''
  head 'https://github.com/maxmind/libmaxminddb.git', :revision => "8299f68bd83da08a3204a1d8bb964ae2f39fdd66"
  version '8299f68bd83da08a3204a1d8bb964ae2f39fdd66'

  depends_on 'automake' => :build
  depends_on 'libtool' => :build

  def install
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
