class Jaekit < Formula
  desc "Seal Core (ha): run records and recorded completion for coding-agent goals"
  homepage "https://github.com/jgoneit/jaekit"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.4/ha_0.1.4_darwin_arm64.tar.gz"
      sha256 "5929688e26e60cbbc6f0071a28199fef499c0504ce0fe34599d15ae2746fbea8"
    end
    on_intel do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.4/ha_0.1.4_darwin_amd64.tar.gz"
      sha256 "496f3d01dbbaf2c59cfccea69c09b0b1a925af734e3fc3ae64a5676b6608b28e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.4/ha_0.1.4_linux_arm64.tar.gz"
      sha256 "a333d6a65af173e227f8d78caba7eb175d4382e51580a6d88f59ddf811024939"
    end
    on_intel do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.4/ha_0.1.4_linux_amd64.tar.gz"
      sha256 "b71962f808eb3d7c4011670a9b096c4c981e5d5db2c5aa4c77752967f7591988"
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
