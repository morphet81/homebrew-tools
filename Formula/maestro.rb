class Maestro < Formula
  desc "Automated workflow orchestration for AI coding agents"
  homepage "https://github.com/morphet81/maestro"
  version "0.4.7"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.7/maestro-darwin-arm64"
    sha256 "75f977a91bc1edad166c017651ce4ab3ad708b76b00b5ec495e018cf4f82c4c6"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.7/maestro-darwin-amd64"
    sha256 "577aa9da4322e94fb55eacf5b5aeba9651fd3d54f9c5b907403e95d7a4ae081c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.7/maestro-linux-amd64"
    sha256 "a4250763a78be3cae6d1b07522de84f23153304c111b9ed46ab5432fb9cfdebf"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.7/maestro-linux-arm64"
    sha256 "75f9dcff13bf81c764772219cb8809d3eaf107141d1b912671f775c8ee844a6e"
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
