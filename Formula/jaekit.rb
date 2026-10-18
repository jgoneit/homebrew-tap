class Jaekit < Formula
  desc "Seal Core (ha): run records and recorded completion for coding-agent goals"
  homepage "https://github.com/jgoneit/jaekit"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.5/ha_0.1.5_darwin_arm64.tar.gz"
      sha256 "f03bd9ab811150f1d82fd28f0119d35b97bf9a8a0aaf12a9a75581d8dcc4ac49"
    end
    on_intel do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.5/ha_0.1.5_darwin_amd64.tar.gz"
      sha256 "9be440946e9b845a140a089d748766c77ea02b51d8fe9bde1c3dbde1c12734bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.5/ha_0.1.5_linux_arm64.tar.gz"
      sha256 "fff47ff71cd09e84bba18f1fbd676e852c296c1d7e7ee927f9e2735bc3ae50f8"
    end
    on_intel do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.5/ha_0.1.5_linux_amd64.tar.gz"
      sha256 "e63efe99d1783f783598aee99634d97c53512fd8b6b979b5a99783f5a3337bcc"
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
