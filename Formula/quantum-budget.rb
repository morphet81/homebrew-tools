class QuantumBudget < Formula
  desc "HTTP API server for Quantum Budget, a personal finance PWA"
  homepage "https://github.com/morphet81/quantum-budget"
  url "https://github.com/morphet81/quantum-budget/releases/download/v0.2.1/quantum-budget-api-linux-x86_64.tar.gz"
  sha256 "685d4729babd650cf396159de7c7053c6ffef161c9dae70aa221d7f4d25c76c9"
  version "0.2.1"

  def install
    unless OS.linux? && Hardware::CPU.intel?
      odie "quantum-budget: Linux x86_64 only (no macOS/ARM Linux build in this release; see #{homepage}/releases)"
    end

    bin.install "quantum-budget-api"
  end

  test do
    assert_predicate bin/"quantum-budget-api", :executable?
  end
end
