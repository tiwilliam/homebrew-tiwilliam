require 'formula'

class Libmaxminddb < Formula
  head 'https://github.com/maxmind/libmaxminddb.git'
  homepage 'https://github.com/maxmind'
  version '0.5.0'

  depends_on 'autoconf' => :build
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
