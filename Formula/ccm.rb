class Ccm < Formula
  desc "Claude Context Manager — auto-save and restore Claude Code session context"
  homepage "https://github.com/mynenikoteshwarrao/claude-context-manager"
  url "https://github.com/mynenikoteshwarrao/claude-context-manager/releases/download/v0.1.0/claude-context-manager-0.1.0.tar.gz"
  sha256 "01ae97b7d5e93793b7d571517439f85de4921f2960c28b683dae7259171daf34"
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
