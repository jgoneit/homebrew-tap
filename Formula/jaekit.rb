class Jaekit < Formula
  desc "Seal Core (ha): run records and recorded completion for coding-agent goals"
  homepage "https://github.com/jgoneit/jaekit"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.2/ha_0.1.2_darwin_arm64.tar.gz"
      sha256 "49d9867304b963c3009498462d0a21dd9455345279f7ae67b72cac48964210fd"
    end
    on_intel do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.2/ha_0.1.2_darwin_amd64.tar.gz"
      sha256 "4e7d62d8286914df2e5d614ac9bdbdcf449e58390f8a8a0a2c1bba6c9f78add0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.2/ha_0.1.2_linux_arm64.tar.gz"
      sha256 "77827bfb67c1724cff57f2b2d9898f4c768502eeb71c622694ec9b06557aeecd"
    end
    on_intel do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.2/ha_0.1.2_linux_amd64.tar.gz"
      sha256 "ade3ad37c68da3ac88f51674cfa3c70ad7d7e193e9f6bbace67f496aed2fb383"
    end
  end

  def install
    bin.install "ha"
  end

  test do
    assert_equal "ha #{version}", shell_output("#{bin}/ha --version").strip
  end
end
