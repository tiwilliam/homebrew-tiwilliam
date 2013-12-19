require 'formula'

class Cudaminer < Formula
  head 'https://github.com/cbuchner1/CudaMiner.git', :revision => '57dd2bf08fd592eb2025355f0abe598438ee1b9b'
  homepage 'https://github.com/cbuchner1'
  version '20131218'

  depends_on 'autoconf' => :build
  depends_on 'automake' => :build

  def install
    ENV['CFLAGS'] = '-O3'
    ENV['CXXFLAGS'] = '-O3'

    system 'autoreconf -i; autoreconf -i'
    system './configure', '--with-cuda=/usr/local/cuda',
                          '--disable-debug',
                          '--disable-dependency-tracking',
                          '--disable-silent-rules',
                          '--prefix=#{prefix}'
    system 'make', 'install'
  end

  test do
    system 'make', 'check'
  end
end
