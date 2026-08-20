class Lazyjira < Formula
  desc "Terminal UI for Jira boards and tickets"
  homepage "https://github.com/morphet81/lazyjira"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.7.5/lazyjira-v0.7.5-aarch64-apple-darwin.tar.gz"
    sha256 "4739a113444fe53f072395c1d3d9ba3750fa4633b330eb943ce65f493d1e13cf"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.7.5/lazyjira-v0.7.5-x86_64-apple-darwin.tar.gz"
    sha256 "897bc7146f2e49f728ab2addee8b437bbee0dc9bcb8dfe0b2f67d0b635c5f641"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.7.5/lazyjira-v0.7.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "073a6791c5b46a89dc57abbec1eaa0be206848190eb52e8d0407535ab5f61a76"
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
