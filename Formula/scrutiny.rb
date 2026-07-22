class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.3.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.4/scrutiny-aarch64-apple-darwin"
    sha256 "b4ff3aa20669c3f0413811d02d7345521bd00237f3d8f9f3230e05f5a4b8ccc3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.4/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "b55043f7649e61f6f85cd7c05b0a0a988a6593c6ae4b5b06f86c46fcd91ef4e4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.4/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "70b13c8000d4406baf3f1fd7aa3c76873d4db51dd9a6a8b0519c1c4577469ecd"
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
