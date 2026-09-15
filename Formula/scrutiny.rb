class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.7.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.0/scrutiny-aarch64-apple-darwin"
    sha256 "0ebed8ff00188323f5366e6201cb0f248ccd6cc0f993adb3f81484cb4d447e40"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.0/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "8073252ed9daab66ea06ec06d2788087f46bc9e8bdf3eca395901a18f3fb1e7d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.0/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "59f582551d7bd2539b1274c20bbfc92d8bf4009482b01e4d17e7154b73e0edbc"
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
