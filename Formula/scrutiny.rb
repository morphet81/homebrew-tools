class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.8.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.8.1/scrutiny-aarch64-apple-darwin"
    sha256 "4d9aee38ed5bd43454f81955751bc893594432498f7be95c0cdf20e05fa0bc51"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.8.1/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "9a3a926547ca07af2d2499e93408c21b959c43a0ad00a20639e1cffd59dd5ca6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.8.1/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "19da4f22946225c337ae8aea96e02a4be235783d2f671e3cfae567aae4160659"
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
