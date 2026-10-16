class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.7.13"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.13/scrutiny-aarch64-apple-darwin"
    sha256 "efc2b46a1123a018393773e6d865a3c01aaf74ce3112493265cf2f7f72599e59"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.13/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "64216ce4ffeaec1d2801999a64a673fd6747b01495fe0132c656116dacd5837e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.13/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "f350c571ab5f249e6250f6d91acf3c1c0ed3590f320d08a2a2d652a2922c256c"
  else
    odie "scrutiny: unsupported platform (macOS Apple Silicon or Linux amd64/arm64 only)"
  end

  def install
    binary = Dir["scrutiny-*"].find { |p| File.file?(p) }
    odie "Could not find scrutiny binary in download" if binary.nil?

    bin.install binary => "scrutiny"
  end

  test do
    assert_predicate bin/"scrutiny", :executable?
  end
end
