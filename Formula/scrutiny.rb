class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.7.15"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.15/scrutiny-aarch64-apple-darwin"
    sha256 "796cf23158d6891b539671453931d35563f7066fa9bd7a3d49e25922a40147ea"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.15/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "0ed8b1e266034b47508a4bd3a4bbcdda8987ad242735ade4c56868cc5b2bb155"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.15/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "5b0ebf1c8763d4fde823cf6849eaaa8c7e13295873bcb7e315caaa82bf3b9c66"
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
