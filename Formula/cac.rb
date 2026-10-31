class Cac < Formula
  desc "Co-Author Committer - fast TUI to amend your latest commit with co-authors"
  homepage "https://github.com/tomhuettmann/cac"
  url "https://github.com/tomhuettmann/cac/releases/download/v1.3.1/cac-1.3.1-macos-arm64.tar.gz"
  sha256 "7067965c121ecdecfe47bf9368a624fdb987c8d6b498ef4d40d1afd908a9b9f8"
  license "MIT"

  def install
    bin.install "cac"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cac --version")
  end
end
