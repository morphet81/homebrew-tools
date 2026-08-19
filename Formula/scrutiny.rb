class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.4.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.4.3/scrutiny-aarch64-apple-darwin"
    sha256 "291f86cabebf197a4ac267593c1b2fa648a77b22e509efb5d75e032c8865016c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.4.3/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "409850a9165df5197002a4dd07acb07a3675fe1ba97ba974c5e18ca3149b181e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.4.3/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "ec8e39fdcf6f99623f6ba62e41dde5e6de83973164e702ef69893522d380b65e"
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
