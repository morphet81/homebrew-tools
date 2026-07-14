class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.1.9"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.1.9/scrutiny-aarch64-apple-darwin"
    sha256 "fc343c0c437d0cd8ccd6a5337da8aedef8013ebf5a15a41af79681a475145735"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.1.9/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "43f1e850e794dae34782e59a77e5c1f06a35d82825acc85c1966a8dafffa52ec"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.1.9/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "5a296e1c0401fe91612d36d2c6ac951f5e70218e6c8f94f3867a7224ae830d5a"
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
