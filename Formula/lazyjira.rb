class Lazyjira < Formula
  desc "Terminal UI for Jira boards and tickets"
  homepage "https://github.com/morphet81/lazyjira"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.7.4/lazyjira-v0.7.4-aarch64-apple-darwin.tar.gz"
    sha256 "6816deceb901b8923a1dc14d106641afa28d5413a9a0b7ea8ecfc8fe66f4ada3"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.7.4/lazyjira-v0.7.4-x86_64-apple-darwin.tar.gz"
    sha256 "624ab8cba3ce6e054bd4e9b365ad6632bbfc6f8ce3299b30457f66eabcfa1b64"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.7.4/lazyjira-v0.7.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "379df8e72f5acd8c30a67ff1388cc53888879bef60983887bafe6e6b7b8fbd9a"
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
