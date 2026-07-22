class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.3.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.5/scrutiny-aarch64-apple-darwin"
    sha256 "bd277f1ee94df49d1438cfc9cfeb01f11a5f6e8c6106a0122785e0af486c2a6f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.5/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "ad16589669b874ea8fa404e310117ef78272a9d1cde6f70e01010cd9b0207d94"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.5/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "6d88fd85e19f7899490803c482d27b78c712657b26c48373afa09b32bd096159"
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
