class Lazyjira < Formula
  desc "Terminal UI for Jira boards and tickets"
  homepage "https://github.com/morphet81/lazyjira"
  url "https://github.com/morphet81/lazyjira.git",
    revision: "e37da44f9ee73edd4ca0fcfafa8bff8f1677ea3f"
  version "0.1.0"
  head "https://github.com/morphet81/lazyjira.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_predicate bin/"lazyjira", :executable?
  end
end
