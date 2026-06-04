# ✻ spinpacks

<p align="left">
  <img src=".github/assets/spinnerverb.gif" width="50%" alt="Spinner Verb">
</p>

Apply themed spinner verb packs to [Claude Code](https://claude.ai/code). Replace or extend the default loading messages with custom phrases from themed packs — currently ships with a _The Office_ pack.

```
$ spinpacks apply the-office
Applied 'the-office' to user scope — 213 verbs active

$ spinpacks sample the-office -n 3
Schruting it
Being Prison Mike
That's what she said
```

## Installation

### Homebrew (recommended)

```sh
brew tap VasylRomanets/spinpacks
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

# Apply a pack to your user-wide Claude Code settings
spinpacks apply the-office

# Preview verbs before applying
spinpacks sample the-office -n 5

# Check what's currently active
spinpacks status

# Remove a pack
spinpacks remove the-office
```

## Commands

| Command | Description |
|---|---|
| `list [--applied] [-v]` | List available packs; `--applied` filters to applied ones, `-v` shows verb count |
| `apply, install <pack>` | Apply a pack to Claude Code settings |
| `remove [<pack>]` | Remove a pack; `--all` removes every tracked pack |
| `update [<pack>]` | Re-apply pack(s) to pick up new verbs after an upgrade |
| `status [--all]` | Show active verbs, mode, and tracked packs; `--all` shows every scope |
| `mode [replace\|append]` | Get or set `spinnerVerbs.mode` (`replace` shows only your verbs; `append` blends with Claude's built-ins) |
| `sample <pack> [-n N]` | Print N random verbs from a pack (default: 1) |
| `info <pack>` | Show pack metadata and a sample of verbs |
| `search <text>` | Search packs by name, description, tags, or verb content |
| `doctor` | Validate settings files, state file, and pack integrity |
| `completions <shell>` | Generate shell completions for bash, zsh, or fish |
| `version` | Print the current version |
| `help [command]` | Show help, or detailed help for a specific command |

Run `spinpacks help <command>` for detailed usage of any command.

## Options

| Option | Description |
|---|---|
| `--scope SCOPE` | Target scope: `user` (default), `project`, `local`, `system` |
| `--overwrite` | Replace all existing verbs instead of appending |
| `--force` | Skip safety guards (re-apply or remove untracked packs) |
| `--all` | Operate on all tracked packs (`remove`/`update`) or show all scopes (`status`) |
| `--applied` | Filter `list` to only applied packs |
| `--dry-run` | Preview changes without writing anything |
| `-v`, `--verbose` | Show detailed output |
| `-q`, `--quiet` | Suppress non-error output |
| `--json` | Output as JSON (useful for scripting) |
| `--no-color` | Disable color output |
| `-n COUNT` | Number of verbs to preview |

Set `NO_COLOR` in your environment to disable color output globally.

## Scopes

spinpacks writes to Claude Code's [settings files](https://docs.anthropic.com/en/docs/claude-code/settings). The `--scope` flag controls which file is modified:

| Scope | File | When to use |
|---|---|---|
| `user` (default) | `~/.claude/settings.json` | Applies to all your projects |
| `project` | `.claude/settings.json` | Applies to the current project (commit to share with team) |
| `local` | `.claude/settings.local.json` | Per-project, never committed |
| `system` | `/Library/Application Support/ClaudeCode/settings.json` | System-wide |

```sh
# Apply to the current project only
spinpacks apply the-office --scope project

# See all scopes at once
spinpacks status --all
```

## Shell completions

Homebrew users get completions installed automatically — no extra steps needed.

For manual installs, generate and install the completion script for your shell:

```sh
# zsh — add to fpath, then run compinit
spinpacks completions zsh > ~/.zsh/completions/_spinpacks

# bash — source in ~/.bashrc
spinpacks completions bash >> ~/.bashrc
source ~/.bashrc

# fish
spinpacks completions fish > ~/.config/fish/completions/spinpacks.fish
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

Once the file is in the packs directory, run `spinpacks apply <name>` to activate it.

## Contributing

Contributions are welcome — new packs especially.

1. Fork the repository
2. Add `packs/<name>.json` following the pack format above
3. Open a pull request

Please run `spinpacks doctor` before submitting to confirm your files are valid.

## License

MIT — see [LICENSE](LICENSE).

Copyright (c) 2026 Vasyl Romanets
