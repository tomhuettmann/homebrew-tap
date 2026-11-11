class BrewBar < Formula
  desc "Native macOS menu bar app showing outdated Homebrew packages"
  homepage "https://github.com/tomhuettmann/brew_bar"
  url "https://github.com/tomhuettmann/brew_bar/releases/download/v1.1.0/BrewBar-1.1.0-macos-arm64.tar.gz"
  sha256 "821e87a656fc496da5b6a2d49247678d7621d6b228d1fa9fcaf6fd0bbb65be82"
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
