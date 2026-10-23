class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.8.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.8.0/scrutiny-aarch64-apple-darwin"
    sha256 "ebe75a4ae56a048649c41c6619f6c3405ee7191b5d5173bcda629c4da586f481"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.8.0/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "0c0ccf3115c6c293bc2659b7c8f74a1bcb22caf9f57c5db3f08c6d8654140fe1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.8.0/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "89384a1d882f57185a0b5087ef74f133fe8f805d3b2cb0b9580f882dfacdac98"
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
