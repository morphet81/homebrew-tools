class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.6.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.6.3/scrutiny-aarch64-apple-darwin"
    sha256 "eec8534e7d1a61af63b32343a97a683c8f31eb0d680f84ee73db312240aba1bb"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.6.3/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "19495eb8043bb14a9918c059bd7496b436e99565559f42ab4dc212644d130f4f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.6.3/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "aabefa8ef531fc85a36c1482eb812c39694fff838bc19ee134e48a87b4d05b38"
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
