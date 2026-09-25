class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.7.8"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.8/scrutiny-aarch64-apple-darwin"
    sha256 "a0c73011a3b1170dbacf1299925687c4ff71bbed782eb336a7bd9efa0a4ba31c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.8/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "a9b9ad8601d49d87d5a6580de37bf8b3507ac932fba1ce63875ce2371e1aecd5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.8/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "73dc5bc34503e991929813336f60ec789eed683a71ae25ed1ef7ebed0955a380"
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
