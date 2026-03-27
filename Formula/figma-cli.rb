class FigmaCli < Formula
  desc "CLI for the Figma REST API"
  homepage "https://github.com/morphet81/figma-cli"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/figma-cli/releases/download/v0.2.0/fcli-v0.2.0-aarch64-apple-darwin.tar.gz"
    sha256 "fd703a1aae4277b79ea9251a9262b4e6a51ba16b98c3b032a9987c5e66f7b0fc"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/morphet81/figma-cli/releases/download/v0.2.0/fcli-v0.2.0-x86_64-apple-darwin.tar.gz"
    sha256 "941ca2804c2682dfb0766b41e01a4d1e0a030bec041170cb85e1b83556d71677"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/figma-cli/releases/download/v0.2.0/fcli-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3f1144259510ecfd4b2e3877dab079c96c863488d71bc7e2c0ca6bd3997f4b10"
  else
    odie "figma-cli: unsupported platform (macOS Apple Silicon or Intel, or Linux x86_64 only)"
  end

  def install
    binary = Dir["fcli-v*/fcli", "fcli"].find { |p| File.file?(p) }
    odie "Could not find fcli binary in archive" if binary.nil?

    bin.install binary => "fcli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fcli --version")
  end
end
