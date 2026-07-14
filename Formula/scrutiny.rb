class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.1.8"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.1.8/scrutiny-aarch64-apple-darwin"
    sha256 "fea7d83208fc74c6167df856b7b33451f7cbd919950337fe4f8dcd52fd088fff"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.1.8/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "2dff32d0cd20172def2510c70bf45fa064a2481738918f48a4ee7cb387ab492a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.1.8/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "83080a9d001bdba9a5550492c6ad7d71a4b71e4a290f1cbae7c9d7fd4655f1cb"
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
