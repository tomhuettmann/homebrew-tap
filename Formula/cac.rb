class Cac < Formula
  desc "Co-Author Committer - A fast terminal UI tool to amend your latest git commit with co-authors"
  homepage "https://github.com/tomhuettmann/cac"
  version "1.0.0"
  license "MIT"

  url "https://github.com/tomhuettmann/cac/releases/download/v#{version}/cac-#{version}-macos-arm64.tar.gz"
  sha256 "fa2d74216fe88e59c7aae3bb6c49c824c27808ceb74ab5ff5fad776965a60659"

  def install
    bin.install "cac"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cac --version")
  end
end
