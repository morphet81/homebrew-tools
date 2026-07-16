class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.2.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.2.2/scrutiny-aarch64-apple-darwin"
    sha256 "0556a6bdbad450e03ae6013e79a6fd75b6523b1a9fd2c9d0b4418e5e2299e588"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.2.2/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "e77d7a4f4792368f175b7ea4b9d589bb9ddf542636771d35445fa6eed55a8acb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.2.2/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "399be759b6d00396efc6814d2f9b65fee108159ed5504e1e091455f3c55da08d"
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
