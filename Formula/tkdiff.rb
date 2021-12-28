class Tkdiff < Formula
  desc "Graphical side by side diff utility"
  homepage "https://tkdiff.sourceforge.io/"
  url "https://downloads.sourceforge.net/project/tkdiff/tkdiff/5.3/tkdiff-5-3.zip"
  version "5.3"
  sha256 "193476bd40766e5c49e2e27c30dc446f97abca8b0b5fe82e6ce8af6e71ea85e7"
  license "GPL-2.0-only"

  livecheck do
    url :stable
    regex(%r{url=.*?/tkdiff/v?(\d+(?:\.\d+)+)/[^"]+?\.zip}i)
  end

  bottle do
    sha256 cellar: :any_skip_relocation, all: "93b6ec3f509020b353acdbe67041c2fab28d08e4e80e0471c3742a6174740b6f"
  end

  uses_from_macos "tcl-tk"

  def install
    bin.install "tkdiff"
  end

  test do
    on_macos do
      system "#{bin}/tkdiff", "--help"
    end

    on_linux do
      # Fails with: no display name and no $DISPLAY environment variable
      return if ENV["HOMEBREW_GITHUB_ACTIONS"]
    end
  end
end
