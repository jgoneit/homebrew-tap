class Jaekit < Formula
  desc "Seal Core (ha): run records and recorded completion for coding-agent goals"
  homepage "https://github.com/jgoneit/jaekit"
  url "https://github.com/jgoneit/jaekit/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2c3daa67bdccf91f743346179dfb74803364e3c141862b64ee8bcf9178875230"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"ha", ldflags: "-X main.version=#{version}"), "./cmd/ha"
  end

  test do
    assert_equal "ha #{version}", shell_output("#{bin}/ha --version").strip
  end
end
