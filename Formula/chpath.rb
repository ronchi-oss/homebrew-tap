class Chpath < Formula
  desc "POSIX shell utility for managing the value of PATH"
  homepage "https://github.com/ronchi-oss/chpath"
  url "https://github.com/ronchi-oss/chpath/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "4e4918b6d90138c8f8d5e7da97e572b70ccca61879d19912db2b3cbe4119b120"
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
