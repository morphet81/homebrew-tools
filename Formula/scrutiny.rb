class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.9.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.9.2/scrutiny-aarch64-apple-darwin"
    sha256 "b9f8f61ca1ae62982b7d6b56c7736e9a526580a7d7b74bc9758979581ca5861a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.9.2/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "c3128319d5051df70e9232818eae0b58b01199600c2a873e21f9fb4b92d8365b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.9.2/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "64a6ac415120046617a84dfda9d91825127370aaabdea909b5754253e1861b8e"
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
