class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.4.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.4.0/scrutiny-aarch64-apple-darwin"
    sha256 "09d196d6bb0cfe696284d73951d90eb70121d13e9c61a45fe65b3819e8dd3003"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.4.0/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "db11dbdf1f9ac5a4f1dacdac554c8383a7209d2236ca00ebd4a75eef67014e1a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.4.0/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "6ad546e90a47a82aa8ce9e2e005e12a810d33602f681d57036a744838e4b6c3b"
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
