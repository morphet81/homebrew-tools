class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.3.11"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.11/scrutiny-aarch64-apple-darwin"
    sha256 "2b9eb87ab220d8478e042e78da89f266464d77b9e53503a7ed1a535975c4c2c3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.11/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "8922479944fec8eacbd781227125d66543bcdd184e65bd4bbfc36ae19f602b06"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.11/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "d449cf1796954b1e0e15ebf250f0418892b634564716b952e7edb6031634e976"
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
