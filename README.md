# homebrew-tools

A [Homebrew tap](https://docs.brew.sh/Taps) for morphet81 CLI tools. Add this tap on your Mac (or Linux, where supported), then install formulas with `brew install`.

## Prerequisites

- [Homebrew](https://brew.sh/)
- **`figma-cli`** ([releases](https://github.com/morphet81/figma-cli/releases)), **`lazyjira`** ([releases](https://github.com/morphet81/lazyjira/releases)), and **`quantum-budget`** ([releases](https://github.com/morphet81/quantum-budget/releases)) ship as prebuilt binaries for Apple Silicon and Intel macOS, and x86_64 Linux. The Figma tool is installed as **`fcli`**; Quantum Budget’s API server is **`quantum-budget-api`**. No compiler is required.
- **`maestro`** ([releases](https://github.com/morphet81/maestro/releases)) ships as a prebuilt binary for Apple Silicon/Intel macOS and amd64/arm64 Linux. Requires **Docker** or **Podman** at runtime.

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
brew install maestro
brew install quantum-budget
```

### Install without tapping first

You can install directly from the GitHub tap path (Homebrew will use the tap as needed):

```bash
brew install morphet81/homebrew-tools/figma-cli
brew install morphet81/homebrew-tools/lazyjira
brew install morphet81/homebrew-tools/maestro
brew install morphet81/homebrew-tools/quantum-budget
```

## Available formulas

| Formula     | Description                          | Upstream                                      |
| ----------- | ------------------------------------ | --------------------------------------------- |
| `figma-cli` | CLI for the Figma REST API           | [morphet81/figma-cli](https://github.com/morphet81/figma-cli)   |
| `lazyjira`  | Terminal UI for Jira boards and tickets | [morphet81/lazyjira](https://github.com/morphet81/lazyjira) |
| `quantum-budget` | HTTP API server for [Quantum Budget](https://github.com/morphet81/quantum-budget); installs as **`quantum-budget-api`** | [morphet81/quantum-budget](https://github.com/morphet81/quantum-budget) |
| `lazyjira@0.4.1` | Same app, pinned **v0.4.1**; installs as `lazyjira-0.4.1` | same |
| `maestro`   | Automated workflow orchestration for AI coding agents | [morphet81/maestro](https://github.com/morphet81/maestro) |

### Older lazyjira (exact version)

`brew install lazyjira` tracks the latest release. To keep **v0.4.1** on your PATH next to the current `lazyjira`, install:

```bash
brew install lazyjira@0.4.1
```

That formula installs the binary as **`lazyjira-0.4.1`** so it does not overwrite `lazyjira`. The formula name uses the full patch version so it matches the GitHub tag you are pinning.

## Verify

```bash
brew tap                              # should list morphet81/homebrew-tools
brew search figma-cli                 # should find the tap formula
fcli --version                        # after installing figma-cli
which lazyjira                        # after installing lazyjira
```

## Updating

Upgrade like any other Homebrew formula after this tap is updated:

```bash
brew update
brew upgrade figma-cli lazyjira lazyjira@0.4.1 maestro quantum-budget
```
