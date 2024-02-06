class Chpath < Formula
  desc "POSIX shell utility for managing the value of PATH"
  homepage "https://github.com/ronchi-oss/chpath"
  url "https://github.com/ronchi-oss/chpath/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "0d2dc3b2be8198d0f5d726086b0b927cbf76f38f3c3add6d36f5a0412fd977da"
  license "MIT"

  depends_on "shelly" => :build

  def install
    system "shelly build > chpath.sh"
    system "shelly build bash_completion > chpath-completion.bash"
    (prefix/"src").install "chpath.sh"
    bash_completion.install "chpath-completion.bash" => "chpath"
  end

  test do
    system ". #{opt_prefix}/src/chpath.sh && line=\"$(chpath version)\" && test \"${line% *}\" = 'chpath version'"
  end
end
