class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.7.14"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.14/scrutiny-aarch64-apple-darwin"
    sha256 "fdfd571e743e7ac6fc379bea09c22308c6254c5f4352348a58984a9a61c18596"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.14/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "103253933bef29d311d478825cca03873d395f5ebd410597d676b0988a341211"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.14/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "a008343d02273ce36ef3161739b6967117aed5e49f2bbff7f5e27dd8cd696fec"
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
