class Cac < Formula
  desc "Co-Author Committer - A fast terminal UI tool to amend your latest git commit with co-authors"
  homepage "https://github.com/tomhuettmann/cac"
  version "1.1.0"
  license "MIT"

  url "https://github.com/tomhuettmann/cac/releases/download/v#{version}/cac-#{version}-macos-arm64.tar.gz"
  sha256 "41268e3a9ccb1a28e229c17a852d92ccb23650a364e975ab49453c75a283f914"

  def install
    bin.install "cac"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cac --version")
  end
end
