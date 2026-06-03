class Lazyjira < Formula
  desc "Terminal UI for Jira boards and tickets"
  homepage "https://github.com/morphet81/lazyjira"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.7.0/lazyjira-v0.7.0-aarch64-apple-darwin.tar.gz"
    sha256 "2c89a642724f12495972fd533423fc56beb35b3283dad140bbd8c12794d72a4c"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.7.0/lazyjira-v0.7.0-x86_64-apple-darwin.tar.gz"
    sha256 "5a1317bb6e6c114f31fcaaf0daa942b74349f80b50db55437277f158725b242a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.7.0/lazyjira-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2ac5127be8bf4cdce010c7457edbf84336575aef1b371421f604152d3f29771d"
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
