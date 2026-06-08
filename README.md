<div align="center">
  <h1>Spinpacks</h1>
  <p><b>Because waiting for LLM generation should never be boring.</b></p>

  [![Homebrew Formula](https://img.shields.io/badge/homebrew-formula-blue.svg)](https://github.com/VasylRomanets/homebrew-spinpacks)
  [![Claude Code](https://img.shields.io/badge/Made_for-Claude_Code-D97757.svg)](https://claude.ai/code)
  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

  <img src=".github/assets/spinnerverb.gif" width="60%" alt="spinpacks demo">
</div>

<br />

Apply themed spinner verb packs to [Claude Code](https://claude.ai/code). Replace or extend the default loading messages with custom phrases from themed packs — currently ships with a _The Office_ pack.

```
$ spinpacks install the-office
Installed 'the-office' in user scope — 230 verbs active

$ spinpacks sample the-office -n 3
Schruting it
Being Prison Mike
That's what she said
```

## Installation

### Homebrew (recommended)

```sh
brew tap VasylRomanets/tap
brew install spinpacks
```

### Manual

```sh
git clone https://github.com/VasylRomanets/spinpacks.git
# Add the bin directory to your PATH, or symlink the executable:
ln -s "$(pwd)/spinpacks/bin/spinpacks" /usr/local/bin/spinpacks
```

## Quick start

```sh
# See what packs are available
spinpacks list

# Install a pack into your user-wide Claude Code settings
spinpacks install the-office

# Preview verbs before installing
spinpacks sample the-office -n 5

# Check what's currently active
spinpacks status

# Remove a pack
spinpacks uninstall the-office
```

## Commands

| Command | Description |
|---|---|
| `list [--installed] [-v]` | List available packs; `--installed` filters to installed ones, `-v` shows verb count |
| `install, add <pack>` | Install a pack into Claude Code settings |
| `uninstall, remove [<pack>]` | Remove a pack; `--all` removes every tracked pack |
| `update [<pack>]` | Reinstall pack(s) to pick up new verbs after an upgrade |
| `status [--all]` | Show active verbs, mode, and tracked packs; `--all` shows every scope |
| `mode [replace\|append] [--dry-run]` | Get or set `spinnerVerbs.mode` (`replace` shows only your verbs; `append` blends with Claude's built-ins) |
| `sample <pack> [-n N]` | Print N random verbs from a pack (default: 1) |
| `info, show <pack>` | Show pack metadata and a sample of verbs |
| `search <text>` | Search packs by name, description, tags, or verb content |
| `doctor` | Validate settings files, state file, and pack integrity |
| `completion <shell>` | Generate shell completion for bash, zsh, or fish |
| `version` | Print the current version |
| `help [command]` | Show help, or detailed help for a specific command |

Run `spinpacks help <command>` for detailed usage of any command.

## Options

| Option | Description |
|---|---|
| `--scope SCOPE` | Target scope: `user` (default), `project`, `local`, `managed` |
| `--force` | Skip safety guards (remove untracked packs) |
| `--all` | Operate on all tracked packs (`uninstall`/`update`) or show all scopes (`status`) |
| `--installed` | Filter `list` to only installed packs |
| `--dry-run` | Preview changes without writing anything |
| `-v`, `--verbose` | Show detailed output |
| `-q`, `--quiet` | Suppress non-error output (write commands only) |
| `--json` | Output as JSON (useful for scripting) |
| `--no-color` | Disable color output |
| `-n, --count COUNT` | Number of verbs to sample |

## Environment

| Variable | Description |
|---|---|
| `NO_COLOR` | Disable color output globally when set (any value) |
| `CLAUDE_CONFIG_DIR` | Override Claude Code's config directory (default: `~/.claude`) |

## Scopes

spinpacks writes to Claude Code's [settings files](https://docs.anthropic.com/en/docs/claude-code/settings). The `--scope` flag controls which file is modified:

| Scope | File | When to use |
|---|---|---|
| `user` (default) | `~/.claude/settings.json` | Applies to all your projects |
| `project` | `.claude/settings.json` | Applies to the current project (commit to share with team) |
| `local` | `.claude/settings.local.json` | Per-project, never committed |
| `managed` | `/Library/Application Support/ClaudeCode/managed-settings.json` | Managed/enterprise |

```sh
# Install into the current project only
spinpacks install the-office --scope project

# See all scopes at once
spinpacks status --all
```

## Shell completions

Homebrew users get completions installed automatically — no extra steps needed.

For manual installs, generate and install the completion script for your shell:

```sh
# zsh — add to fpath, then run compinit
spinpacks completion zsh > ~/.zsh/completions/_spinpacks

# bash — source in ~/.bashrc
spinpacks completion bash >> ~/.bashrc
source ~/.bashrc

# fish
spinpacks completion fish > ~/.config/fish/completions/spinpacks.fish
```

## Pack format

A pack is a single JSON file in the packs directory. It is a JSON object with a required `verbs` array and optional metadata fields:

```json
{
  "description": "A short description of the pack",
  "author": {
    "name": "Your Name",
    "url": "https://github.com/you"
  },
  "tags": ["category", "theme"],
  "verbs": [
    "Doing the thing",
    "Making it happen",
    "Crunching numbers"
  ]
}
```

| Field | Required | Description |
|---|---|---|
| `verbs` | Yes | Array of verb strings shown in Claude Code's spinner. Short phrases (2–6 words) look best. |
| `description` | No | One-line summary shown by `list -v` and `info` |
| `author.name` | No | Name of the person who created the pack |
| `author.url` | No | Link to the author's profile or homepage |
| `tags` | No | Search keywords used by `search`; use spaces not hyphens (e.g. `"the office"`, not `"the-office"`) |

Once the file is in the packs directory, run `spinpacks install <name>` to activate it.

## Contributing

Contributions are welcome — new packs especially.

1. Fork the repository
2. Add `packs/<name>.json` following the pack format above
3. Open a pull request

Please run `spinpacks doctor` before submitting to confirm your files are valid.

## License

MIT — see [LICENSE](LICENSE).

Copyright (c) 2026 Vasyl Romanets
