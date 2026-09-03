class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.5.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.5.2/scrutiny-aarch64-apple-darwin"
    sha256 "f27ef4ffdbcdafc5ff65c019241df76919c79968cbaac7c5b2ba27008e886be2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.5.2/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "91ab84001b532d19af56f5332d119a613e339b1961863ed71e83d8bc881a2917"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.5.2/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "bbbcada7d28a643d83e6f3b351ff0c3596f4e33293bacf4ee4151fd652552f45"
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
