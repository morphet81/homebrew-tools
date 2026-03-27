class Lazyjira < Formula
  desc "Terminal UI for Jira boards and tickets"
  homepage "https://github.com/morphet81/lazyjira"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.4.1/lazyjira-v0.4.1-aarch64-apple-darwin.tar.gz"
    sha256 "516809bfa5b7b256068c382d1008ba4ec731611177e765008e4a7d25158a32ce"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.4.1/lazyjira-v0.4.1-x86_64-apple-darwin.tar.gz"
    sha256 "a52f6934a07a03a97dc568c652b472afd3bfd1b2d134d174ef4ffb1a86c7b8d2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.4.1/lazyjira-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d8baeab8fb68e75d258f89f438bbe1aae0e1f8b3c63d50ccd18dc2e074138656"
  else
    odie "lazyjira: unsupported platform (macOS Apple Silicon or Intel, or Linux x86_64 only)"
  end

  def install
    binary = Dir["lazyjira-v*/lazyjira", "lazyjira"].find { |p| File.file?(p) }
    odie "Could not find lazyjira binary in archive" if binary.nil?

    bin.install binary => "lazyjira"
  end

  test do
    assert_predicate bin/"lazyjira", :executable?
  end
end
