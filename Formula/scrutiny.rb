class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.3.9"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.9/scrutiny-aarch64-apple-darwin"
    sha256 "4b4da75f01b3e67db3de21b838ef859f88b9506751cda10f78891bedeba8795e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.9/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "d92953515f7ed16e62b8420441b7b57a9593ecd1f3516179a845a6d7c1ba516c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.9/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "9edbf0659e7436cd3881a2b699e836be434182f10fbdd0e0ce1ef30a4c62b6b9"
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
