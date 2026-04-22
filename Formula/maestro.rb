class Maestro < Formula
  desc "Automated workflow orchestration for AI coding agents"
  homepage "https://github.com/morphet81/maestro"
  version "0.4.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.4/maestro-darwin-arm64"
    sha256 "d4ad07fbdbdc8a6f4d026a365ced7c4ec1d475f4e55d609a8a4d69448d94d9ed"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.4/maestro-darwin-amd64"
    sha256 "60f5ee4929cc5971ad7e05eb764fe291bba5a139e9675231ff4c7d9078f0edfb"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.4/maestro-linux-amd64"
    sha256 "331f84096c4be09daceed8270c374f174155502098dec7ae1a95a68d4bd81ecd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/maestro/releases/download/vv0.4.4/maestro-linux-arm64"
    sha256 "71dee4d616680b5cfacc774f8e1a5ee42a967b6680bfc74582a76f5126f3a1cd"
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
