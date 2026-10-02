class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.7.10"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.10/scrutiny-aarch64-apple-darwin"
    sha256 "406ea3056b584b2470647b1505b72e75fd8fb9a749752b29392deee8e6de501d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.10/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "7be8430048c37413c8e14cb60ced8843f1f949e0fe84839f6c298c41d805fa03"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.10/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "513bbd6f1b0cf1c0c339c65d35540e0514d35cc62fee9909131a8022f43329fe"
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
