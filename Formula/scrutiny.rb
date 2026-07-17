class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.3.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.1/scrutiny-aarch64-apple-darwin"
    sha256 "20ca566efdeb6a39f942b56038ede4989082e03e78dce860d581f252fe66511b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.1/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "b3ec7d3846830911c7638c8fc70302a0eebf0785316b19f65c886ee022ac27ec"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.1/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "623128b7ebf2a914da485084a5b1b28cda9e6cd52fc325cfcd150b495bff6596"
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
