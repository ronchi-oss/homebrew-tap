class Chpath < Formula
  desc "POSIX shell utility for managing the value of PATH"
  homepage "https://github.com/ronchi-oss/chpath"
  url "https://github.com/ronchi-oss/chpath/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "17fd419d50e0481e70a691980e11bd3e8f0167c3aacc336781378c0819b4ae01"
  license "MIT"

  depends_on "shelly" => :build

  def install
    system "shelly build > chpath.sh"
    system "shelly build bash_completion > chpath-completion.bash"
    (prefix/"src").install "chpath.sh"
    bash_completion.install "chpath-completion.bash" => "chpath"
  end

  test do
    system ". #{opt_prefix}/src/chpath.sh && chpath version"
  end
end
