class Jaekit < Formula
  desc "Seal Core (ha): run records and recorded completion for coding-agent goals"
  homepage "https://github.com/jgoneit/jaekit"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.1/ha_0.1.1_darwin_arm64.tar.gz"
      sha256 "cae1f1d8d2c38bbb68ea5500a63f88f4cd24687d4b424d40c94efb6bce928e55"
    end
    on_intel do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.1/ha_0.1.1_darwin_amd64.tar.gz"
      sha256 "12922a68f1abb9d14a28e172ae9461488a3b2d095f1fa5774c8bab8570882163"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.1/ha_0.1.1_linux_arm64.tar.gz"
      sha256 "02ee960dce8e1bd91c4076fcc8aaf61c19b6a262482dc031123169eacc0a81dd"
    end
    on_intel do
      url "https://github.com/jgoneit/jaekit/releases/download/v0.1.1/ha_0.1.1_linux_amd64.tar.gz"
      sha256 "56eae57cf2486e2c4f41a43cfdf2073a74975bef7a81ec6f7dbecc4b61b7a589"
    end
  end

  def install
    bin.install "ha"
  end

  test do
    assert_equal "ha #{version}", shell_output("#{bin}/ha --version").strip
  end
end
