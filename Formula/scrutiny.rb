class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.3.8"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.8/scrutiny-aarch64-apple-darwin"
    sha256 "1ed2c88f8915df320ae776eea97baa1eb25128f0d056117ed0baa21789bbdcaf"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.8/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "398d5efab1cdacdea7c1a4a75f7fd3ca3cc50dc0a534e9e69e03f7d95de13105"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.8/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "ba68efb906fc3d595b04d129188169e99270b52a296eaf0de8b5ae272b1ced9f"
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
