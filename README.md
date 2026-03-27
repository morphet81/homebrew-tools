# homebrew-tools

A [Homebrew tap](https://docs.brew.sh/Taps) for morphet81 CLI tools. Add this tap on your Mac (or Linux, where supported), then install formulas with `brew install`.

## Prerequisites

- [Homebrew](https://brew.sh/)
- **`figma-cli`** is built from source with Rust via Homebrew’s `rust` dependency; the first install may take several minutes.
- **`lazyjira`** is installed from [GitHub release](https://github.com/morphet81/lazyjira/releases) binaries (Apple Silicon and Intel macOS, and x86_64 Linux). No compiler is required.

## Add the tap

Run once per machine:

```bash
brew tap morphet81/homebrew-tools
```

That makes the formulas in this repository available to `brew`.

## Install tools

After tapping:

```bash
brew install figma-cli
brew install lazyjira
```

### Install without tapping first

You can install directly from the GitHub tap path (Homebrew will use the tap as needed):

```bash
brew install morphet81/homebrew-tools/figma-cli
brew install morphet81/homebrew-tools/lazyjira
```

## Available formulas

| Formula     | Description                          | Upstream                                      |
| ----------- | ------------------------------------ | --------------------------------------------- |
| `figma-cli` | CLI for the Figma REST API           | [morphet81/figma-cli](https://github.com/morphet81/figma-cli)   |
| `lazyjira`  | Terminal UI for Jira boards and tickets | [morphet81/lazyjira](https://github.com/morphet81/lazyjira) |

## Verify

```bash
brew tap                              # should list morphet81/homebrew-tools
brew search figma-cli                 # should find the tap formula
fcli --version                        # after installing figma-cli
which lazyjira                        # after installing lazyjira
```

## Head builds

`figma-cli` can be built from the latest default branch instead of the pinned git revision:

```bash
brew install figma-cli --HEAD
```

## Updating

Upgrade like any other Homebrew formula after this tap is updated:

```bash
brew update
brew upgrade figma-cli lazyjira
```
