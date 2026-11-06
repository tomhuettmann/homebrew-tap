class BrewBar < Formula
  desc "Native macOS menu bar app showing outdated Homebrew packages"
  homepage "https://github.com/tomhuettmann/brew_bar"
  url "https://github.com/tomhuettmann/brew_bar/releases/download/v1.0.0/BrewBar-1.0.0-macos-arm64.tar.gz"
  sha256 "53283dba7f0801fd28541a644f4406f714e57488e360e44f3bf6f2849a05948b"
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
