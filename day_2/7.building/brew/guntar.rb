# 2013-11-21 Modified from the stock Homebrew gnu-tar formula to install as
#            gnutar to satisfy a hard-coded dependency in the fpm RubyGem.

require 'formula'

class Gnutar < Formula
  homepage 'http://www.gnu.org/software/tar/'
  url 'http://ftpmirror.gnu.org/tar/tar-1.27.tar.gz'
  mirror 'http://ftp.gnu.org/gnu/tar/tar-1.27.tar.gz'
  sha1 '790cf784589a9fcc1ced33517e71051e3642642f'

  def install
    args = ["--prefix=#{prefix}", "--mandir=#{man}"]
    args << "--program-prefix=gnu"

    system "./configure", *args
    system "make install"
  end
end
