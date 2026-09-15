class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.7.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.1/scrutiny-aarch64-apple-darwin"
    sha256 "ae281ce5d682348c567299353c7a69d05baf4ba82c573e142ffed7190ef816fd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.1/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "c50f2204071441a722c280a841e627ac3a07d5f73545cf0bae547b6c3aa756f4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.1/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "375e98b0f1ff1bb04cedd31463939b29bc0eb27dd5d1009ececac9be653e0686"
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
