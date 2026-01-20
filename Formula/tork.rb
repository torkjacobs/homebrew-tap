# frozen_string_literal: true

class Tork < Formula
  include Language::Python::Virtualenv

  desc "AI Agent Governance CLI - PII detection, policy enforcement, and audit logging"
  homepage "https://tork.network"
  url "https://github.com/torkjacobs/tork-governance/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"
  head "https://github.com/torkjacobs/tork-governance.git", branch: "main"

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
