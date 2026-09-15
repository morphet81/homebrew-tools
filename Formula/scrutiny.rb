class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.6.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.6.5/scrutiny-aarch64-apple-darwin"
    sha256 "ae1b30d3dea138544a2bbb1fe052d4b7992ce4b9d8978e63ca6d7d7225a71a01"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.6.5/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "f53bb2d983c3fcfc20e87ee5475ed1334f9ca34396851a2305ddd34bc689ae0d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.6.5/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "f1d515349d4bf0814be83be8cb0ee1aea199cff5000607937c215ee700520bb4"
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
