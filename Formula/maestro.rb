class Maestro < Formula
  desc "Automated workflow orchestration for AI coding agents"
  homepage "https://github.com/morphet81/maestro"
  version "0.4.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.3/maestro-darwin-arm64"
    sha256 "6d30025d35102b00833e34bbd1634f0449018ff2c98a96903b62bf3d947621c4"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.3/maestro-darwin-amd64"
    sha256 "3a355153ad9a3963b9a991402acd3ce88325719e353fd123c9e2c733087df025"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.3/maestro-linux-amd64"
    sha256 "13d25c5798fc2218fea1228045eda815fc6f984332226cd1c8c7d498e5cac397"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.3/maestro-linux-arm64"
    sha256 "349195ee974af55f95660c0cb8d1271e47546798a0615d75887054f9ed9ac6ac"
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
