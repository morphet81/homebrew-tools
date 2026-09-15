class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.6.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.6.4/scrutiny-aarch64-apple-darwin"
    sha256 "f5728b20219dc283ddc6e6c6fad817ccbc875342e673a676b5d333bee6c069ee"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.6.4/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "b4c5bb40477c2ac7545f2eb079a27431b5bd83ce94396c4bfd32507f28b5ba82"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.6.4/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "9f57af82f1e67f35734fcea9ddab4ba4424b90a8c8b38c0659c9f813e84383b4"
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
