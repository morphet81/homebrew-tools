class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.6.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.6.0/scrutiny-aarch64-apple-darwin"
    sha256 "2151aea6fef434871d8d1befae833f05d2031af152dcf3cf053d6927bade73b3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.6.0/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "60762bb283d37427adf85dcc61c2052f35b8509d5d03111cbf95cd2d867497f8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.6.0/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "14b38d3f3617bab011200ba0f4f0a9b94cc23ab7de67be7a57b9fdc3553b4e13"
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
