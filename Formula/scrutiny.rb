class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.7.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.4/scrutiny-aarch64-apple-darwin"
    sha256 "5733257d24f8f15d6d3b3ca26e2ac3b0a517cfa63023d10938ef16747c367de6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.4/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "d3fd4812e6c2ebb048599083b311f9603d47aab78980500b479cbee257735702"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.4/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "98b15896c47266bf908793996ddcb52ce221a74b583602560a47baac92e173a4"
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
