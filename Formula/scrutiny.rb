class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.5.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.5.4/scrutiny-aarch64-apple-darwin"
    sha256 "b2852d607272ff7de4ae59fb08a2ac09b8c3e36f4db957608a2fa77c83f3a2c8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.5.4/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "c3f9cb16141aa131e0d7408fe5403a66103889c0b681dade697218cde250b32c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.5.4/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "6e70bc69d3d5c4ed699ed13b73e887616f30ac310b83cb2930b7cd7545b2aad6"
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
