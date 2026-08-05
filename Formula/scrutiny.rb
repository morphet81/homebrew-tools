class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.4.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.4.1/scrutiny-aarch64-apple-darwin"
    sha256 "5de4bcd5c8d1c0338fc26e64c539e66c7272300627cf15b886d0c48053dc35b5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.4.1/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "d2d5505b157d7cbb0b033e8a9e36e02d84bfcafbf49c13327f855b4d4a020db6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.4.1/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "9117251bf98c043738e7f5d783ae491ff2ea7668660f272650fcab88f8ff2699"
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
