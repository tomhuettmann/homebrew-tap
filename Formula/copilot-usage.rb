class CopilotUsage < Formula
  desc "Native macOS menu bar app showing your GitHub Copilot premium request usage"
  homepage "https://github.com/tomhuettmann/copilot_usage"
  url "https://github.com/tomhuettmann/copilot_usage/releases/download/v2.2.0/CopilotUsage-2.2.0-macos-arm64.tar.gz"
  sha256 "fc1383d0f1f099ffd20ad7b2d51c4c1b4ce0863a5734dba8613fdd47f9d5edd4"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "CopilotUsage"
  end

  service do
    run opt_bin/"CopilotUsage"
    keep_alive crashed: true
    process_type :interactive
    log_path var/"log/copilot-usage.log"
    error_log_path var/"log/copilot-usage.log"
  end

  def caveats
    <<~EOS
      After starting the service, set your GitHub token via the menu bar: Set Token…
    EOS
  end

  test do
    assert_predicate bin/"CopilotUsage", :executable?
  end
end
