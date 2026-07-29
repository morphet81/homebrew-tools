class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.3.7"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.7/scrutiny-aarch64-apple-darwin"
    sha256 "5caae38939edca9e961098f10f3672fbf175a8b845e3e2d167dd816c336c1047"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.7/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "a5e79541524c5577c07c162768d3f38481b7120bbe663745b421456e5fb5045d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.7/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "c94e13d79dc547047d6f567bc7cf008e3c87d89fcce4e829320c2e966744ccff"
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
