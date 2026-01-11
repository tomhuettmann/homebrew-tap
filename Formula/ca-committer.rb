class CaCommitter < Formula
  desc "Co-Author Committer - Interactive git commit tool with co-author support"
  homepage "https://github.com/tomhuettmann/ca-committer"
  version "1.0.0"
  license "MIT"

  url "https://github.com/tomhuettmann/ca-committer/releases/download/v#{version}/cac-#{version}-macos-universal.tar.gz"
  sha256 "407421556a0741d6ee0cb0267dcf435ed0f69b3c1a24bd7407b66c5c9e177ab0"

  def install
    bin.install "cac"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cac --version")
  end
end
