class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.7.9"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.9/scrutiny-aarch64-apple-darwin"
    sha256 "10ec7d73acb81f45ab36b5a811aa7e6e4aaa4880e96f7b2ff7d89e543d478de6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.9/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "2016d3026826cf238ca4005ad85d7e9afbd9fb89b309679ffe2125c761aed40f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.9/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "ce4a89ca9854e5800ab416f339d6967bf553d4d44db7d9831c48ac35a4f5493b"
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
