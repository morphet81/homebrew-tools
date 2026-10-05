class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.7.12"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.12/scrutiny-aarch64-apple-darwin"
    sha256 "8bb3755e3c628bc712b0b9ca83ff9e5a3d81a7064393898d0dc2d7f9bb604031"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.12/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "36dff9b45d9b60f5ad14d6da7610484f1eaa4b3230af59e72fcf8f6d4deafb49"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.12/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "e59f1e9fa5b68859081785bb5e6596298aecd9863ef8bd454e1fcf35bda4b14e"
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
