class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.9.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.9.1/scrutiny-aarch64-apple-darwin"
    sha256 "864ff8c65c1ed1d625b26a7846c5de37ad3e53dd9113db21e69fb403573a2669"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.9.1/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "ba633cc24a22cd5bc2bfc08246de6de1e4c90bb38133789d39d5303f73922584"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.9.1/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "428d72b39c29308c6bd1cc49905164ca211d313ac8998c7548d7213230a7ca4b"
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
