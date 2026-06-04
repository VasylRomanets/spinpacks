# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Syntax check
ruby -c bin/spinpacks

# Run any command
ruby bin/spinpacks <command>

# Regenerate static completion files (required after changing commands or options)
make completions

# Audit Homebrew formula
make audit
```

There is no build step. No gems or external dependencies — standard library only (`json`, `optparse`, `fileutils`).

## Architecture

The entire CLI lives in a single file: `bin/spinpacks`. It is structured top-to-bottom:

1. **Constants** — `CLAUDE_DIR` (respects `$CLAUDE_CONFIG_DIR`, falls back to `~/.claude`), `SCOPES`, `PACKS_DIR`, `STATE_FILE`, `META_FIELDS`, `ALL_COMMANDS`, `VALID_OPTIONS`
2. **Color module** — TTY/stream-aware; `Color.red_err` checks `$stderr.tty?`, everything else checks `$stdout.tty?`
3. **Inline completion scripts** — ZSH/BASH/FISH heredocs; mirrored as static files in `completions/` via `make completions`
4. **Help text** — `COMMAND_HELP` (per-command) and `HELP_TEXT` (top-level)
5. **I/O helpers** — `say` (respects `$quiet`), `print_error` (always prints to stderr)
6. **File helpers** — `write_json` uses atomic tmp+mv writes; `read_pack_data` validates pack structure
7. **Command functions** — one `cmd_*` function per command
8. **Entrypoint** — `OptionParser`, then `case subcommand`

## Two distinct "mode" concepts

These are easy to conflate:

- **`merge_mode`** (`'append'`/`'replace'`) — tracked per-pack in the state file. Controls how spinpacks merges a pack's verbs with other already-applied packs' verbs. `'replace'` means the pack's verbs completely replace existing ones; other tracked packs are automatically untracked.
- **`spinnerVerbs.mode`** — written to Claude Code's `settings.json`. Controls whether Claude Code blends custom verbs with its built-ins (`append`) or shows only custom verbs (`replace`). Managed by the `mode` command. When `spinnerVerbs` doesn't exist yet, `cmd_apply` defaults this to `'replace'`.

## Pack format

A pack is a single JSON file in `packs/`. Required field: `verbs` (string array). Optional metadata fields defined in `META_FIELDS`: `description`, `author` (object with `name` and `url`), `tags`.

## State file

Tracks which packs are applied to which scope and with which merge mode. Located at `~/.local/state/spinpacks/state.json`. Created lazily on first `apply`. Structure: `{ "user": { "the-office": "append" }, ... }`. The `migrate_scope` helper handles the old array format for backward compatibility.

## Adding a new command

1. Add to `ALL_COMMANDS`
2. Add to `VALID_OPTIONS`
3. Add to `COMMAND_HELP`
4. Add to `HELP_TEXT`
5. Add cases to ZSH/BASH/FISH completion heredocs
6. Add `cmd_*` function
7. Add `when` case to the entrypoint dispatch
8. Run `make completions`
