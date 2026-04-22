class Maestro < Formula
  desc "Automated workflow orchestration for AI coding agents"
  homepage "https://github.com/morphet81/maestro"
  version "0.4.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.5/maestro-darwin-arm64"
    sha256 "4921db991c2e52bbc41cb8708a098b3d5c2de0af1a297f03129e64b4ae9c5f2f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.5/maestro-darwin-amd64"
    sha256 "c16e26c68f2ddb33d3e6247293829b5bb8897d4df0724b9ea7b523699e2a7a4a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.5/maestro-linux-amd64"
    sha256 "158fa33e09abb0f94ab542b4dbd174795a6802c88e7d2e72693b7df4a1f80d54"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.5/maestro-linux-arm64"
    sha256 "0952ceb1f88e546fa5eea62b87085892b70abcbb587b84f9d1add88e81e5a1dd"
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
