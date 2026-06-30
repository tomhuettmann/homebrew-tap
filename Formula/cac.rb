class Cac < Formula
  desc "Co-Author Committer - A fast terminal UI tool to amend your latest git commit with co-authors"
  homepage "https://github.com/tomhuettmann/cac"
  version "1.3.0"
  license "MIT"

  url "https://github.com/tomhuettmann/cac/releases/download/v#{version}/cac-#{version}-macos-arm64.tar.gz"
  sha256 "8b1473968ed93388add00b76ed4734bad473928d9772ef9eaf044da88003e743"

  def install
    bin.install "cac"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cac --version")
  end
end
