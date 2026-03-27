class Fcli < Formula
  desc "CLI for the Figma REST API"
  homepage "https://github.com/morphet81/figma-cli"
  url "https://github.com/morphet81/figma-cli.git",
    revision: "56ed56e37b219a499ddb422a9a17d6718076f1ea"
  version "0.1.0"
  head "https://github.com/morphet81/figma-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fcli --version")
  end
end
