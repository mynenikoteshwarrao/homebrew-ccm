class Ccm < Formula
  desc "Claude Context Manager — auto-save and restore Claude Code session context"
  homepage "https://github.com/mynenikoteshwarrao/claude-context-manager"
  url "https://github.com/mynenikoteshwarrao/claude-context-manager/releases/download/v0.1.0/claude-context-manager-0.1.0.tar.gz"
  sha256 "faba40036e35aeb6fd48e5080cfd6b0a79c9dba5f363b93fa0bd617ed2db6d13"
  license "MIT"

  depends_on "bash"
  depends_on "jq"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/ccm"
  end

  def caveats
    <<~EOS
      After installing, register hooks and slash commands with:
        #{libexec}/install.sh

      Or run it from this command:
        bash "#{libexec}/install.sh"
    EOS
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/ccm version")
  end
end
