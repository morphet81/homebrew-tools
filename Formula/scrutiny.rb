class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.1.14"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.1.14/scrutiny-aarch64-apple-darwin"
    sha256 "1fe4f458cf2fb76c4133c83527e08c9f07fdb25e33e5cc5921568b970f96d393"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.1.14/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "6ee115c639ffe4530a427469f53f9bd09c17b1a594102f09a54328d90623452d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.1.14/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "10ddaf45f57dc5a940bec05eddccba7585452d82175b6562da05c8220f3b4eff"
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
