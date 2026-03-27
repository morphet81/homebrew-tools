class Lazyjira < Formula
  desc "Terminal UI for Jira boards and tickets"
  homepage "https://github.com/morphet81/lazyjira"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.4.2/lazyjira-v0.4.2-aarch64-apple-darwin.tar.gz"
    sha256 "812cc32bba8f436938961579c0c33642f6021f0ca332f7b2109f61515719c9a9"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.4.2/lazyjira-v0.4.2-x86_64-apple-darwin.tar.gz"
    sha256 "535e55026bd59b6948e0b959b75bc747d27f4dfb763c3c7b9475f37ab7877007"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.4.2/lazyjira-v0.4.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "117a400f13ccbfb70bcc122bf9118b63089976a3dc78ebc32bbc88c4edaa6e82"
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
