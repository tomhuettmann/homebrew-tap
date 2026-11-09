class BrewBar < Formula
  desc "Native macOS menu bar app showing outdated Homebrew packages"
  homepage "https://github.com/tomhuettmann/brew_bar"
  url "https://github.com/tomhuettmann/brew_bar/releases/download/v1.0.1/BrewBar-1.0.1-macos-arm64.tar.gz"
  sha256 "6b0354fb59d42eb04deeec96ccd481d3d9e2827fc1b23ce1696f07b3ddb5ffb5"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "BrewBar"
  end

  service do
    run opt_bin/"BrewBar"
    keep_alive crashed: true
    process_type :interactive
    log_path var/"log/brew-bar.log"
    error_log_path var/"log/brew-bar.log"
  end

  test do
    assert_predicate bin/"BrewBar", :executable?
  end
end
