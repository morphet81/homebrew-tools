class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.5.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.5.3/scrutiny-aarch64-apple-darwin"
    sha256 "e15773cccaefb94f8f15492c4f735a5e1d80a976336406de54379610c4690c73"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.5.3/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "3481bd0dc0b0a855e67a4ad9a04820fd5ca7ee2b36b7d82475439444c07cf979"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.5.3/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "e2dc9c7b5a523afb7fb68180b1f4533a210cfbd932fe4d2d0d0e93031a3a2955"
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
