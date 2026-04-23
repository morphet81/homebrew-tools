class Maestro < Formula
  desc "Automated workflow orchestration for AI coding agents"
  homepage "https://github.com/morphet81/maestro"
  version "0.4.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.6/maestro-darwin-arm64"
    sha256 "f27a4fe1eff09db6be995d2094643194094eca7232e9894f5ad7f53ee867afbe"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.6/maestro-darwin-amd64"
    sha256 "ee46fe4d6419b747228a3c9bd497994f0f6151f79bf4cb3189126d3a0d288b6c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.6/maestro-linux-amd64"
    sha256 "38edff176673e14cbd1d9a182abf64a424ebf45dbb3914bde1ca58c8e4d70ec0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.6/maestro-linux-arm64"
    sha256 "77f5d0475ffe92012fc4db614f4d3fa2b071edb8f653dfdea97a3bd88299d44d"
  else
    odie "maestro: unsupported platform (macOS Apple Silicon/Intel or Linux amd64/arm64 only)"
  end

  def install
    binary = Dir["maestro-*"].find { |p| File.file?(p) }
    odie "Could not find maestro binary in download" if binary.nil?

    bin.install binary => "maestro"
  end

  test do
    assert_predicate bin/"maestro", :executable?
  end
end
