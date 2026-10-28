class Scrutiny < Formula
  desc "Code review and ticket implementation CLI for AI agent skills"
  homepage "https://github.com/morphet81/scrutiny"
  version "0.8.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.8.2/scrutiny-aarch64-apple-darwin"
    sha256 "85fd2ea1d840d77bc2acbed1cf10a503c3707c5354284a093c6c224117505dd9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.8.2/scrutiny-x86_64-unknown-linux-gnu"
    sha256 "f5a3b42b61cb08c7c69861cb309a802b9573528bb67e88289b4e34ad8796394a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/morphet81/scrutiny/releases/download/v0.8.2/scrutiny-aarch64-unknown-linux-gnu"
    sha256 "4540a1b1d59844e458df08674d5d1445b9a941b3ac344fbdbafd6eed057b9033"
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
