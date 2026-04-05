class QuantumBudget < Formula
  desc "HTTP API server for Quantum Budget, a personal finance PWA"
  homepage "https://github.com/morphet81/quantum-budget"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/morphet81/quantum-budget/releases/download/v0.2.5/quantum-budget-api-v0.2.5-aarch64-apple-darwin.tar.gz"
    sha256 "b13059021f0aa2943c3ba30432e1af705acb5c3d82d890ffa992e600c8fa5b7e"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/morphet81/quantum-budget/releases/download/v0.2.5/quantum-budget-api-v0.2.5-x86_64-apple-darwin.tar.gz"
    sha256 "3f20d30f84c2bdaf7d59262dbf0af7bcd6cc70181346c05816a7e02f4d9f0342"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/morphet81/quantum-budget/releases/download/v0.2.5/quantum-budget-api-v0.2.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e35f5768a14fc106b136b81c497f8a209e780fbc01cd9f5fc52d8c968dfbdbd1"
  else
    odie "quantum-budget: unsupported platform (macOS Apple Silicon or Intel, or Linux x86_64 only)"
  end

  version "0.2.5"

  def install
    binary = Dir["quantum-budget-api-v*/quantum-budget-api", "quantum-budget-api"].find { |p| File.file?(p) }
    odie "Could not find quantum-budget-api binary in archive" if binary.nil?

    bin.install binary => "quantum-budget-api"
  end

  test do
    assert_predicate bin/"quantum-budget-api", :executable?
  end
end
