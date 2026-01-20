# Homebrew Tap for Tork

Official Homebrew tap for installing Tork AI Governance CLI on macOS and Linux.

## Installation

```bash
# Add the tap
brew tap torkjacobs/tap

# Install tork
brew install tork
```

## One-liner

```bash
brew install torkjacobs/tap/tork
```

## What's Included

- **CLI Tool** (`tork`) - Command-line interface for AI governance
- **Python SDK** - Full governance library for Python applications
- **PII Detection** - Scan text and files for sensitive data
- **Policy Enforcement** - Validate content against governance policies

## Usage

```bash
# Scan text for PII
tork scan "My email is test@example.com"

# Scan a file
tork scan --file ./data.txt

# Evaluate content against policies
tork evaluate --policy content_safety "Some text"

# Start the governance API server
tork serve --port 8000

# Get help
tork --help
```

## Configuration

Set your API key for cloud features:

```bash
export TORK_API_KEY="your-api-key"
```

## Updating

```bash
brew update
brew upgrade tork
```

## Uninstalling

```bash
brew uninstall tork
brew untap torkjacobs/tap
```

## Requirements

- macOS 12+ or Linux
- Python 3.11 (installed automatically)

## Links

- [Tork Website](https://tork.network)
- [Documentation](https://tork.network/docs)
- [GitHub](https://github.com/torkjacobs/tork-governance)
- [Issues](https://github.com/torkjacobs/homebrew-tap/issues)

## License

MIT
