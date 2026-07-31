class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.3.10"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.10/scrutiny-aarch64-apple-darwin"
    sha256 "e77b7ebc8d7e29325ce232356153b01684caccfac87139cdc5c9269712d66554"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.10/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "d754959d74b198c402c6c02b9307a1589b12f84020db256356567c138a9c02e5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.10/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "2dad3381cf0a1c74d381ef43b331328db108d3a8f94884e51ae7bca1a1416e3d"
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
