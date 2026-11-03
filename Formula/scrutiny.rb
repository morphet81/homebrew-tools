class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.8.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.8.4/scrutiny-aarch64-apple-darwin"
    sha256 "486da7363198acc0ebec7f7382a9c26f49187d5044b7f5718e693c5c86b53eb6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.8.4/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "57a6ee4d4c81192342eafb8a1612c21f8f26ac4ffeb29f93b14b80876eefd8ae"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.8.4/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "7df41f11b505ebdf90a7eedd2f9783193f54649ed76e45927b9807dca5c60df0"
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
