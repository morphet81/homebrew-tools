class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.3.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.2/scrutiny-aarch64-apple-darwin"
    sha256 "9d35defce8e844470efa0aba884f88941427f3cd8980b4610d480c11b10f3a27"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.2/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "a38144df88f4f7cee6da540abe646d15bfd1d48dfde5e16cfec57424da6608b0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.3.2/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "428f774b4bbe8d510428e598a2fb44c601788fc39bafe236d9b0e0d0408ba554"
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
