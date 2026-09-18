class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.7.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.6/scrutiny-aarch64-apple-darwin"
    sha256 "37ae9cb6dda8e6879d1758bdcb7ad59c3b591c91ec7e88641b4f55e7e8dfaebd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.6/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "61b1545f7ddcfcc529396029323715f773a7ee67987d4a79411f2be0517bd64f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.6/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "6cf7fd5ee8a16f78f6a65d448648ce76222032b160d48a1498f1c42aa91a5e8b"
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
