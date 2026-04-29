class HowToSay < Formula
  desc "Phonetic pronunciation lookup for English words"
  homepage "https://github.com/redodson01/how-to-say"
  url "https://github.com/redodson01/how-to-say/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "de8e1dc6cadf3950b965d6e3eb71a1a0a4dd1ca4f5e6cb3f3eddc9ceae6ffe65"
  license "MIT"

  def install
    bin.install "bin/hts"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/hts 2>&1", 1)
  end
end
