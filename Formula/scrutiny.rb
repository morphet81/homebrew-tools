class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.7.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.3/scrutiny-aarch64-apple-darwin"
    sha256 "053b0c5401eb71b92f82ccd9f84c8e730912b6f041c00f6700ace35470bad739"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.3/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "052d70200fc73476db390635385543cc6a81c8a050d08b50063f17d09e26e8e2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.3/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "fb066c23d47e61e249b23844067f1115f2020c5763f56622f71a540882eb7196"
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
