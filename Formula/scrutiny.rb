class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.5.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.5.1/scrutiny-aarch64-apple-darwin"
    sha256 "3d462ad8ca501fc524e6df22d3388423869deb6ec36b57feb1cdaa0db58eeb48"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.5.1/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "8e65bcd337fe60ddecb0b467a51d4f4c30eea2594f382a390cf8656d1fb2a711"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.5.1/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "b44d1ad45b6fb77d2f01d165a0040a5f23b6348c9a71be10a1d9502c7d37a09a"
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
