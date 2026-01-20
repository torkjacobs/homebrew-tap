# frozen_string_literal: true

class Tork < Formula
  include Language::Python::Virtualenv

  desc "AI Agent Governance CLI - PII detection, policy enforcement, and audit logging"
  homepage "https://tork.network"
  url "https://files.pythonhosted.org/packages/5f/f5/273ccd01f2f36d4a987fac905b439d052e1c8f51379522a8edeb72311a7c/tork_governance-0.8.1.tar.gz"
  sha256 "437dbe13e72b928fcc036939d9d7ab2e150b51721b87e6c542f4b326db2c7b1e"
  license "MIT"

  depends_on "python@3.11"

  def install
    # Create virtual environment
    venv = virtualenv_create(libexec, "python3.11")

    # Install the package with all dependencies via pip
    system libexec/"bin/pip", "install", "--upgrade", "pip"
    system libexec/"bin/pip", "install", buildpath

    # Symlink the CLI binary
    bin.install_symlink libexec/"bin/tork"
  end

  def caveats
    <<~EOS
      Tork Governance CLI has been installed!

      Quick Start:
        # Scan text for PII
        tork scan "My email is test@example.com"

        # Evaluate against policies
        tork evaluate --policy content_safety "Some text to check"

        # Start the governance API server
        tork serve --port 8000

      Configuration:
        export TORK_API_KEY="your-api-key"

      Documentation: https://tork.network/docs
    EOS
  end

  test do
    assert_match "tork", shell_output("#{bin}/tork --help").downcase
  end
end
