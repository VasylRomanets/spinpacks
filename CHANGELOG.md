# Changelog

## [1.2.0] - 2026-06-06

### Added
- `--count` as a long-form alias for `-n` on `sample` (e.g. `sample the-office --count 5`)
- `show` command as an alias for `info`
- `add` command as an alias for `install`
- `--dry-run` support for `mode` command

### Changed
- `list --verbose --json` now includes `description` in each pack object, matching the non-JSON verbose output
- `install` is now the primary command (was `apply`); `apply` is removed
- `uninstall` is now the primary command (was `remove`); `remove` kept as alias
- `completions` renamed to `completion` (singular) to match CLI convention
- `--applied` flag renamed to `--installed` on `list`/`ls`
- `--json` support for `version` and `help` commands
- `help --json` outputs command descriptions as key-value pairs
- Environment section to README documenting `NO_COLOR` and `CLAUDE_CONFIG_DIR`

### Removed
- `--overwrite` flag from `install `/`add` — use `uninstall --all` then `install` instead

### Changed
- Renamed `system` scope to `managed` — matches Claude Code's official terminology
- Fixed managed scope path to `managed-settings.json`
- `status` and `mode` show "No packs installed" instead of empty output when nothing is configured
- `status --all` filters out empty scopes

### Fixed
- `mode` displayed stored value instead of `n/a` when no verbs active
- `mode` write path created an orphan `spinnerVerbs: {verbs: []}` stub when no packs were installed
- ZSH completion offered `--force` for `update` (invalid flag for that command)
- `completions --no-color` triggered a false "has no effect" warning
- Unused-flag warning for `-n` displayed `--count` instead of `-n`
- `list --scope` without `--installed` silently ignored the scope — now warns
- `status --scope` combined with `--all` silently ignored the scope — now warns
- `update --all <pack>` silently ignored `--all` — now warns and drops the pack name
- ZSH completion for `install`/`add` only completed pack names, not flags
- BASH completion did not offer `-n` in the global flag list
- README commands table omitted the `uninstall` alias from the `remove` row

## [1.1.1] - 2026-06-05

### Fixed
- Version constant was not updated for 1.1.0 release

## [1.1.0] - 2026-06-05

### Changed
- `the-office` pack expanded from 213 to 230 verbs — added verified moments from Dinner Party, Niagara, Garage Sale, Stress Relief, Casino Night, and more; removed inaccurate verbs

## [1.0.0] - 2026-06-05

### Added
- Initial release
- Commands: `list`, `apply`, `remove`, `update`, `status`, `mode`, `sample`, `info`, `search`, `doctor`, `completions`
- Aliases: `install` (apply), `uninstall` (remove), `ls` (list)
- Scopes: user, project, local, system
- Shell completions for bash, zsh, and fish
- `the-office` pack (213 verbs)
