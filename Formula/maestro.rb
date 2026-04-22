class Maestro < Formula
  desc "Automated workflow orchestration for AI coding agents"
  homepage "https://github.com/morphet81/maestro"
  version "0.4.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.2/maestro-darwin-arm64"
    sha256 "f157533c2047a7c53c539a58d9447c93d5272235746b6147a0d8d86317d252bd"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.2/maestro-darwin-amd64"
    sha256 "bc249e36be7bcbedc28ac532a858767eb47f7fb0c21708354d1e94013b833c9d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.2/maestro-linux-amd64"
    sha256 "9e6d80068b5d0099c0f893381d2674ca880fb21518ea846ca1ee98efbda40386"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.2/maestro-linux-arm64"
    sha256 "55cd41411a4923e5dd70a6f03bda1d6e4ffbdeb29f3e44cf203383bb3703de40"
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
