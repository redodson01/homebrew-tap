# typed: false
# frozen_string_literal: true

# Template — the release workflow substitutes VERSION/SHA placeholders
# and pushes the result to redodson01/homebrew-tap.
class CmdGuard < Formula
  desc "Fast, compiled PreToolUse hook for Claude Code that intercepts dangerous shell commands"
  homepage "https://github.com/redodson01/cmd-guard"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/redodson01/cmd-guard/releases/download/v0.1.0/cmd-guard-x86_64-apple-darwin.tar.gz"
      sha256 "c26b27c749189a3b46ff5bf633aeeb29f2df9ff51c45d0f79da3c89102694817"
    end
    if Hardware::CPU.arm?
      url "https://github.com/redodson01/cmd-guard/releases/download/v0.1.0/cmd-guard-aarch64-apple-darwin.tar.gz"
      sha256 "3a8f1b70a32a357995ce0ee8acdcbe743bf826e659f359f61365740b03f8c05f"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/redodson01/cmd-guard/releases/download/v0.1.0/cmd-guard-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "59b8c558b0e36910f44baedc948339a169a6575667d42fe99c608d771e7aad86"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/redodson01/cmd-guard/releases/download/v0.1.0/cmd-guard-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "570ccf6cb80ca08081b668f9dce3a24cb31adf5028a53ea61519a1aa523538b9"
    end
  end

  def install
    bin.install "cmd-guard"
  end

  def caveats
    <<~EOS
      To configure the Claude Code hook, run:
        cmd-guard --setup

      Re-run after upgrading to update the symlink.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cmd-guard --version")
  end
end
