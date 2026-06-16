class Lazyjira < Formula
  desc "Terminal UI for Jira boards and tickets"
  homepage "https://github.com/morphet81/lazyjira"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.7.2/lazyjira-v0.7.2-aarch64-apple-darwin.tar.gz"
    sha256 "c5f92933776fd52bdb11149ca63860e6338cf1a9ab4a7c6a6e87a747615e3aff"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.7.2/lazyjira-v0.7.2-x86_64-apple-darwin.tar.gz"
    sha256 "35e8738b57d0bfd52a986ba520131f99d93a39544bbb5b025cb5eff627f0c9da"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/lazyjira/releases/download/v0.7.2/lazyjira-v0.7.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "87c8e602e4d21c80e71c043b2722ef6aca205a337aa99f5afc245f097753756c"
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
