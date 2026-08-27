class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.5.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.5.0/scrutiny-aarch64-apple-darwin"
    sha256 "4fabe115a1bf2896771cf5088fdd9cfc4bcd6d743d1f57c7214689f72f5faafd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.5.0/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "27ce5bc473c1d916827bdc2da1276c221ae3b6844cfd57f0eef3826f74e7670d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.5.0/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "9c2a7c1e21ded76c9a5d9010d8c779893a81d7ad0a8a3791aa77a286cbd2e7bf"
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
