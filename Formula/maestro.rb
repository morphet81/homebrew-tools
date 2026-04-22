class Maestro < Formula
  desc "Automated workflow orchestration for AI coding agents"
  homepage "https://github.com/morphet81/maestro"
  version "0.4.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.0/maestro-darwin-arm64"
    sha256 "b3fb6efff30b708b56ab2a2de9768ce4f7753ff3ee5a0a7cfbb71d3dc539ff6f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.0/maestro-darwin-amd64"
    sha256 "b9a8617b89b979db569e158b1b58f27946dae1b8a305743e158ca746ab7e3f3f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.0/maestro-linux-amd64"
    sha256 "2b9a1c62714ea5cff73fa35299f51de2b49e6d197e9c94cefb407d96e052964f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.0/maestro-linux-arm64"
    sha256 "da6452b057c05d38581f915ffd614954950ffff3616615826805cacdc9ad0eb6"
  else
    odie "maestro: unsupported platform (macOS Apple Silicon/Intel or Linux amd64/arm64 only)"
  end

  def install
    binary = Dir["maestro-*"].find { |p| File.file?(p) }
    odie "Could not find maestro binary in download" if binary.nil?

    bin.install binary => "maestro"
  end

  test do
    assert_predicate bin/"maestro", :executable?
  end
end
