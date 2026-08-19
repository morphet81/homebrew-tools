class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.4.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.4.2/scrutiny-aarch64-apple-darwin"
    sha256 "9589c8321552ba5e3f60508afe58b9517b5093c2ba88582fa4aab4e206fe6008"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.4.2/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "918f6205f2c221bf6ffe8a9ffe13fa2417482222e4e1aa2ff69ddf45599934a4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.4.2/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "3850c824a61715a852a241655edef4ef011df89023a7676293a999327ce7f781"
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
