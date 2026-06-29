class Cac < Formula
  desc "Co-Author Committer - A fast terminal UI tool to amend your latest git commit with co-authors"
  homepage "https://github.com/tomhuettmann/cac"
  version "1.2.0"
  license "MIT"

  url "https://github.com/tomhuettmann/cac/releases/download/v#{version}/cac-#{version}-macos-arm64.tar.gz"
  sha256 "d7dd7e8b320ebd5477496a416862826f4c7700fc5729ddc4235d5fde636fc328"

  def install
    bin.install "cac"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cac --version")
  end
end
