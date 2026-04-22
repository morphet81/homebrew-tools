class Maestro < Formula
  desc "Automated workflow orchestration for AI coding agents"
  homepage "https://github.com/morphet81/maestro"
  version "0.4.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.1/maestro-darwin-arm64"
    sha256 "3e1be7461137c9b6f02ae0b2712bbfbfb89791e1f2a2118d6827621adf5f0e4e"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.1/maestro-darwin-amd64"
    sha256 "cfdd23a6ce760ec3ec61bcefdbe8652a62d439ed99cdb06703f7f00b3b444f99"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.1/maestro-linux-amd64"
    sha256 "857e5180edfae278263babd21960445c583e3fdf6a9287ee55bec1582c018119"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.1/maestro-linux-arm64"
    sha256 "0e23aa64694ffa86d8a8d211c42aca102340b2016311dfb6f58ef6f85b19abb9"
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
