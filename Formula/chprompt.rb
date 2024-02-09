class Chprompt < Formula
  desc "Manage your bash PS1 prompt with ease"
  homepage "https://github.com/ronchi-oss/chprompt"
  url "https://github.com/ronchi-oss/chprompt/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "fcff5328ec887be74cf8ecaf27689656256587bbae131b07c07e090530f4cbb0"
  license "MIT"

  depends_on "shelly" => :build

  def install
    system "shelly build > chprompt.sh"
    system "shelly build bash_completion > chprompt-completion.bash"
    (prefix/"src").install "chprompt.sh"
    bash_completion.install "chprompt-completion.bash" => "chprompt"
  end

  test do
    system ". #{opt_prefix}/src/chprompt.sh && l=\"$(chprompt version)\" && test \"${l% *}\" = 'chprompt version'"
  end
end
