class Bc < Formula
  desc "arbitrary precision numeric processing language"
  homepage "https://www.gnu.org/software/bc/"
  url "https://ftpmirror.gnu.org/bc/bc-1.07.tar.gz"
  mirror "https://ftp.gnu.org/gnu/bc/bc-1.07.tar.gz"
  sha256 "55cf1fc33a728d7c3d386cc7b0cb556eb5bacf8e0cb5a3fcca7f109fc61205ad"

  bottle do
    cellar :any_skip_relocation
    sha256 "def84a9cd7f95263f20ebc17e3a47d529c9a8568315cc2754c6072b281259d28" => :el_capitan
    sha256 "d3d8fa4f7eb53ac19b43f576ffb8f58a985de1a2adf689e439a78899abefac3f" => :yosemite
    sha256 "7438af8ab383f113f0689d957961ead1e9c51f9e191287392c95bdbe35cba857" => :mavericks
  end

  keg_only :provided_by_osx

  unless OS.mac?
    depends_on "bison" => :build
    depends_on "flex" => :build
  end

  def install
    system "./configure",
      "--disable-debug",
      "--disable-dependency-tracking",
      "--disable-silent-rules",
      "--prefix=#{prefix}",
      "--infodir=#{info}",
      "--mandir=#{man}"
    system "make", "install"
  end

  test do
    system "#{bin}/bc", "--version"
    assert_match "2", pipe_output("#{bin}/bc", "1+1\n")
  end
end
