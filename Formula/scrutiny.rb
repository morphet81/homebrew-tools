class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.3.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.3/scrutiny-aarch64-apple-darwin"
    sha256 "1cb063ab32fe0a5b9a3b2fef2238aa3002b605b543bf3107d7c1a0249782cee9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.3/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "45ff1c7666a955ab3f212380901f26c0eedf21c255c3f66db661fc465f6bbd7f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.3/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "134247e7f821001a5cb01e1261e517f656e7fb36ee8d031fbe12d88eb7f2853d"
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
