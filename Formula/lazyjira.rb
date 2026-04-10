class Lazyjira < Formula
  desc "Terminal UI for Jira boards and tickets"
  homepage "https://github.com/morphet81/lazyjira"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.5.0/lazyjira-v0.5.0-aarch64-apple-darwin.tar.gz"
    sha256 "1bc242b4f3e85b874ae86bda04123fd482251d81c9c758a534925976ea6f874d"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.5.0/lazyjira-v0.5.0-x86_64-apple-darwin.tar.gz"
    sha256 "e1235683975308f4f82b981509284f0e1d1ad1beb163e33c29442b68a1fc3a67"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.5.0/lazyjira-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ff7b92b2f260cc72f30e59787d479bf4829feae37b0f3d7972db9e88c5acacbe"
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
