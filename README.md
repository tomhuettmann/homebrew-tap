# Homebrew Tap for Tom Hüttmann's Tools

This is a Homebrew tap for my macOS tools and utilities.

## Installation

```bash
brew tap tomhuettmann/tap
brew trust tomhuettmann/tap
```

## Available Formulas

### cac (Co-Author Committer)

A fast terminal UI tool to amend your latest git commit with co-authors.

```bash
brew install tomhuettmann/tap/cac
```

**Homepage:** https://github.com/tomhuettmann/cac

### copilot-usage (CopilotUsage)

A tiny, native macOS menu bar app showing your GitHub Copilot premium request usage. Apple Silicon only.

```bash
brew install tomhuettmann/tap/copilot-usage
brew services start copilot-usage
```

**Homepage:** https://github.com/tomhuettmann/copilot_usage

### brew-bar (BrewBar)

A tiny, native macOS menu bar app showing your outdated Homebrew packages. Apple Silicon only.

```bash
brew install tomhuettmann/tap/brew-bar
brew services start brew-bar
```

**Homepage:** https://github.com/tomhuettmann/brew_bar

## Updating a formula

```bash
./update.sh <formula> <version>   # e.g. ./update.sh cac 1.3.1
```
