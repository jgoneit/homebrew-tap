class Jaekit < Formula
  desc "Seal Core (ha): run records and recorded completion for coding-agent goals"
  homepage "https://github.com/jgoneit/jaekit"
  version "0.1.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.6/ha_0.1.6_darwin_arm64.tar.gz"
      sha256 "0f6a6a470949378c06df4e63d4a2bebed43c5ecb945a0c9460d88e2362150aa1"
    end
    on_intel do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.6/ha_0.1.6_darwin_amd64.tar.gz"
      sha256 "88d88f0d2fe3763affea4af752692966f71605ab57f1ad1473168cf905061b49"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.6/ha_0.1.6_linux_arm64.tar.gz"
      sha256 "4e03e348b86ad8417ee90702aea6ff215daa0703e2fff8672ebdc99bc04249f5"
    end
    on_intel do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.6/ha_0.1.6_linux_amd64.tar.gz"
      sha256 "ca3866c86e6760aff38b9a95ec6b4ff2b8887a33ee1035e51fe693041b39a0be"
    end
  end

  def install
    bin.install "ha"
    pkgshare.install "tools", "examples", "guides", "contracts", "assets", "README.md", "README.en.md", "LICENSE"
  end

  test do
    assert_equal "ha #{version}", shell_output("#{bin}/ha --version").strip
    require "json"
    assert_equal "run-rules/3", JSON.parse(shell_output("#{bin}/ha capabilities --format json")).fetch("default_rules")
    assert_predicate pkgshare/"tools/check-result-reference.py", :file?
    assert_predicate pkgshare/"examples/check-result/declaration.json", :file?
  end
end
