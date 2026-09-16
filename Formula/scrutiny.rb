class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.7.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.5/scrutiny-aarch64-apple-darwin"
    sha256 "1f9a55058b7c2055d17783262d2c0ea635c6a14ca2ee30510e61d5a52db9443f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.5/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "5cda9bed98b504d275dd51709a9d87a672558de51507bc7cee38671ce721e4cc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.7.5/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "6a852205db647f6bdc453b5e44ee372f59e8f57e38647d03d2b0cac907fc42a6"
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
