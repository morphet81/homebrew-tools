class StoryTeller < Formula
  desc "CLI tool for managing stories"
  homepage "https://github.com/morphet81/story-teller"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/story-teller/releases/download/v0.2.4/story-teller-v0.2.4-aarch64-apple-darwin.tar.gz"
    sha256 "39306504f7a78a0025ce2674db499b5ce6a2c06ca9daf38a6e83070181db8e95"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/morphet81/story-teller/releases/download/v0.2.4/story-teller-v0.2.4-x86_64-apple-darwin.tar.gz"
    sha256 "a4176fe5be7a3360f232a937c578481cea3a8a6267b4eb48033d0e4f2cc4088a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/story-teller/releases/download/v0.2.4/story-teller-v0.2.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2aa5cfcca8769414fb564f2565512b022565379dcc09e1041f50bca0eb60b91d"
  else
    odie "story-teller: unsupported platform (macOS Apple Silicon or Intel, or Linux x86_64 only)"
  end

  def install
    binary = Dir["story-teller-v*/story-teller", "story-teller"].find { |p| File.file?(p) }
    odie "Could not find story-teller binary in archive" if binary.nil?

    bin.install binary => "story-teller"
  end

  test do
    assert_predicate bin/"story-teller", :executable?
  end
end
