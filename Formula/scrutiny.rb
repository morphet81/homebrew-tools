class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.1.12"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.1.12/scrutiny-aarch64-apple-darwin"
    sha256 "27ec7f07ff9fa2394fc2792d4e9de89a8779cd081703f274fe52d8ef36987700"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.1.12/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "c58a61072a445c83277d380bf8d04ff14aaae722c13194e80aa713f9b664b757"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.1.12/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "08cad2201707a1a3c8999ae7b43af2c2d9c442bada9d5482ebc12c5b7ab9019a"
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
