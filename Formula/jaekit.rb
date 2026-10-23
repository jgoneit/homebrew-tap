class Jaekit < Formula
  desc "Seal Core (ha) and Spar (spar): recorded completion for coding-agent goals"
  homepage "https://github.com/jgoneit/jaekit"
  version "0.1.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.7/ha_0.1.7_darwin_arm64.tar.gz"
      sha256 "c63210bfb1073dca63a9a6d4386f359d4fb6ee3658314dcc128428e87b0084dc"
    end
    on_intel do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.7/ha_0.1.7_darwin_amd64.tar.gz"
      sha256 "df474d5fdf371f6257b68a52beeb312579a17b266513c134f6e72a3e8f1f4024"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.7/ha_0.1.7_linux_arm64.tar.gz"
      sha256 "94607660a2aa043b50a44fb40ea132529492c2471d3ffbec9c1f56d1b3a96556"
    end
    on_intel do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.7/ha_0.1.7_linux_amd64.tar.gz"
      sha256 "97b5bcba8603e48639c62829e9dc36b49debc0fda9fbde095edc0d4f50694948"
    end
  end

  def install
    bin.install "ha", "spar"
    pkgshare.install "tools", "examples", "guides", "contracts", "assets", "README.md", "README.ko.md", "LICENSE"
  end

  test do
    assert_equal "ha #{version}", shell_output("#{bin}/ha --version").strip
    assert_equal "spar #{version}", shell_output("#{bin}/spar --version").strip
    require "json"
    assert_equal "run-rules/3", JSON.parse(shell_output("#{bin}/ha capabilities --format json")).fetch("default_rules")
    assert_predicate pkgshare/"tools/check-result-reference.py", :file?
    assert_predicate pkgshare/"examples/check-result/declaration.json", :file?
  end
end
