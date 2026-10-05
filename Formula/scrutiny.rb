class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.7.11"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.11/scrutiny-aarch64-apple-darwin"
    sha256 "246c3c390cdc54ea6dd20ac57b658f5360b9b70aa990f17b655c00bd1d93d218"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.11/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "737402f02e1c44ad99eaca810fb91df63761197a5a56c4c793f6fc1d323c9f52"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.11/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "7f34bf30cd673aedcbb63a22ea17397cb091aceec13b69ceb7b0b327de11ba56"
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
