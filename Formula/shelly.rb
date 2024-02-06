class Shelly < Formula
  desc "Tooling for managing multi-file POSIX shell projects"
  homepage "https://github.com/ronchi-oss/shelly"
  url "https://github.com/ronchi-oss/shelly/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "0d4d615b7c339be5e248cf33191e235e7ae3611c075af4ec3f2de06e7e37827a"
  license "MIT"

  def install
    system './bin/shelly-build -s main > shelly'
    system './bin/shelly-build bash_completion > shelly-completion.bash'
    bin.install 'shelly'
    bash_completion.install 'shelly-completion.bash' => 'shelly'
  end

  test do
    system "line=\"$(#{bin}/shelly version)\" && test \"${line% *}\" = 'shelly version'"
  end
end
