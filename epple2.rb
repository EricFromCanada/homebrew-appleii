class Epple2 < Formula
  desc "Emulator of the original APPLE ][ and APPLE ][ PLUS computers"
  homepage "http://mosher.mine.nu/epple2"
  url "https://github.com/cmosher01/Epple-II.git",
       :revision => "c50307a571b27f6de241fb609f94439c455bcd9b"
  version "c50307a5"
  head "https://github.com/cmosher01/Epple-II.git"

  depends_on "apple-ii-disk-tools"
  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "sdl2"
  # For apple2sys:
  depends_on "xa" => :build

  needs :cxx11

  resource "apple2sys" do
    url "https://github.com/cmosher01/Apple-II-Source/archive/1.0.tar.gz"
    sha256 "50c4b7a05550d0b3b4da76c133bf60e33df0319dfe03fa5ad4518203f72e5c89"
  end

  def install
    ENV.cxx11
    ENV.append "CXXFLAGS", "-DETCDIR=\\\"#{etc}\\\""

    resource("apple2sys").stage do
      system "./bootstrap", "--skip-po"
      system "./configure", "--prefix=#{prefix}"
      system "make", "install"
    end

    opts = []
    opts << "--disable-dependency-tracking"
    opts << "--disable-silent-rules"
    opts << "--prefix=#{prefix}"

    system "autoreconf", "--install"
    system "./configure", *opts
    system "make", "install"
    # Rename default configuration file and install epple2.conf manually,
    # so that it won't be deleted if epple2 is removed.
    File.rename prefix/"etc/epple2/epple2.conf", prefix/"etc/epple2/epple2.conf.default"
    (etc/"epple2").install "conf/epple2.conf" unless File.exist?(etc/"epple2/epple2.conf")
  end

  def caveats; <<~EOS
    Please read Warning Concerning Copyright Restrictions here:

        http://mosher.mine.nu/apple2/site/

    Configuration files are in #{etc}/epple2.

    After upgrading you may need to update the import path in
        #{etc}/epple2/epple2.conf

    Use Cmd-Alt-Esc to quit Epple ][ when in full-screen mode.
    EOS
  end

  test do
    system "false"
  end
end
