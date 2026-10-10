class Jaekit < Formula
  desc "Seal Core (ha): run records and recorded completion for coding-agent goals"
  homepage "https://github.com/jgoneit/jaekit"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.3/ha_0.1.3_darwin_arm64.tar.gz"
      sha256 "4d4dde8cad5f798b0a114140908ba1bb584d3544f7b4e905cb2c9ef401afee40"
    end
    on_intel do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.3/ha_0.1.3_darwin_amd64.tar.gz"
      sha256 "0db541f77de8b9edc68ac1133d1b9e2cad2dc766e72190c1e33b67676d00c2b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.3/ha_0.1.3_linux_arm64.tar.gz"
      sha256 "dafc7460bfc446d3af83d3db1f55cd96e3ac20fbdc392f9f08483a482d06d48e"
    end
    on_intel do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.3/ha_0.1.3_linux_amd64.tar.gz"
      sha256 "e98895a21e77fd82ee80e61d66c0b53dfec0f269452806e29a6db11b6ee9f73f"
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
