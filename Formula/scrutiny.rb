class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.1.16"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.1.16/scrutiny-aarch64-apple-darwin"
    sha256 "c169ecd50f20f7d12b46097f7041e7b275a8ea6d30087e5793e02dd28afb75ae"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.1.16/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "4f94f2f7de46d4bfc69633401656136c0261c85175b1387eeeb2a8bbb46c1b2b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.1.16/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "46dc9e63b9f0d6b58d39519859f06047c3e988ae7e06174ae64cadc4379da967"
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
