class Llvm6502 < Formula
  desc "LLVM backend for 6502"
  homepage "https://github.com/c64scene-ar/llvm-6502"
  url "https://github.com/c64scene-ar/llvm-6502.git",
    revision: "f91a14ca03a76a7c034e6b71343a8cb2986ed594"
  version "20150804" # Date of commit
  head "https://github.com/c64scene-ar/llvm-6502.git"

  depends_on "cmake" => :build
  depends_on "libffi" => :recommended # http://llvm.org/docs/GettingStarted.html#requirement
  if MacOS.version <= :snow_leopard
    depends_on "python"
  else
    depends_on "python" => :optional
  end

  def install
    mkdir "build" do
      system "cmake", "..", "-DLLVM_TARGETS_TO_BUILD:STRING='X86;Mos6502'", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    system "false"
  end
end
