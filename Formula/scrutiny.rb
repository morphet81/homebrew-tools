class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.8.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.8.5/scrutiny-aarch64-apple-darwin"
    sha256 "9251aa6b05b5df756f43ec3eafd5241df0f043fcb19314aa20a4c097e23e97fe"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.8.5/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "7e235c2ccec67210f95e4759945557cef5a51d10c364d3ea21da3792517e8e69"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.8.5/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "8b8d284d555d062025ce5deabb2281f6e1d6365f454f6da1e5e3d99a1e74f0d3"
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
