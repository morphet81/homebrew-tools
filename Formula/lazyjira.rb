class Lazyjira < Formula
  desc "Terminal UI for Jira boards and tickets"
  homepage "https://github.com/morphet81/lazyjira"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.6.0/lazyjira-v0.6.0-aarch64-apple-darwin.tar.gz"
    sha256 "f774201887d5c7fe4883592ac87e7dd2698929be76ff2790db1842e1350caa60"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.6.0/lazyjira-v0.6.0-x86_64-apple-darwin.tar.gz"
    sha256 "cc099cab7ff1c40c9aea347d39cb27a8b12fca72ce0884d7e4e504d247ad343c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.6.0/lazyjira-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b4b3a5429133bea7904ad071f04bd0b83c8417baf8ef97dd79b5bb979510ba5a"
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
